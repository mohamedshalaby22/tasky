import 'package:dio/dio.dart';
import 'package:tasky/core/helpers/token_storage.dart';
import 'package:tasky/core/networking/api_constants.dart';
import 'package:tasky/features/login/data/models/refresh_token_response.dart';

class DioInterceptor extends InterceptorsWrapper {
  final Dio dio;
  DioInterceptor(this.dio);

  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = await TokenStorage.getAccessToken();
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    return super.onRequest(options, handler);
  }

  @override
  onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) { 
      final refreshToken = await TokenStorage.getRefreshToken();
      if (refreshToken != null) {
        try {
          final refreshResponse = await _refreshAccessToken(refreshToken);
          if (refreshResponse != null) {
            final newAccessToken = refreshResponse.accessToken;
            await TokenStorage.saveTokens(
              accessToken: newAccessToken,
              refreshToken: refreshToken,
            );

            RequestOptions options = err.requestOptions;

            // إذا كانت البيانات هي FormData، قم بتحديثها
            if (options.data is FormData) {
              options = _cloneRequestOptions(options);
              options.headers['Authorization'] = 'Bearer $newAccessToken';
            } else {
              options.headers['Authorization'] = 'Bearer $newAccessToken';
            }

            // إعادة إرسال الطلب
            final retryResponse = await dio.fetch(options);
            return handler.resolve(retryResponse);
          } else {
            return handler.reject(DioException(
              requestOptions: err.requestOptions,
              error: 'Refresh token invalid or expired',
              type: DioExceptionType.badResponse,
            ));
          }
        } catch (e) {
          return handler.reject(DioException(
            requestOptions: err.requestOptions,
            error: 'Error refreshing token: $e',
            type: DioExceptionType.badResponse,
          ));
        }
      } else {
        return handler.reject(DioException(
          requestOptions: err.requestOptions,
          error: 'No refresh token available',
          type: DioExceptionType.badResponse,
        ));
      }
    }
    return super.onError(err, handler);
  }

  Future<RefreshTokenResponse?> _refreshAccessToken(String refreshToken) async {
    try {
      final response = await dio.get(
        '${ApiConstants.apiBaseUrl}/auth/refresh-token',
        queryParameters: {'token': refreshToken},
      );
      if (response.statusCode == 200) {
        return RefreshTokenResponse.fromJson(response.data);
      }
      return null;
    } catch (e) {
      throw Exception('Error refreshing token: $e');
    }
  }

  // for MultipartFile
  RequestOptions _cloneRequestOptions(RequestOptions options) {
    return RequestOptions(
      path: options.path,
      method: options.method,
      headers: {...options.headers}, // نسخ الهيدرز الأصلية
      queryParameters: options.queryParameters,
      data: FormData.fromMap({
        // نسخ الحقول النصية
        ...Map.fromEntries((options.data as FormData).fields),
        // نسخ الملفات مع الحقول النصية
        ...(options.data as FormData)
            .files
            .asMap()
            .map((_, file) => MapEntry(file.key, file.value)),
      }),
    );
  }
}
