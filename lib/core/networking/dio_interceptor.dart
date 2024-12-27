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

    options.headers['Authorization'] = 'Bearer $accessToken';

    return super.onRequest(options, handler);
  }

  @override
  onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      print('Received 401 error, attempting to refresh token...');
      final refreshToken = await TokenStorage.getRefreshToken();

      if (refreshToken != null) {
        final refreshResponse = await _refreshAccessToken(refreshToken);

        if (refreshResponse != null) {
          final newAccessToken = refreshResponse.accessToken;
          await TokenStorage.saveTokens(
            accessToken: newAccessToken,
            refreshToken: refreshToken,
          );
          final options = err.requestOptions;
          options.headers['Authorization'] = 'Bearer $newAccessToken';
          try {
            final retryResponse = await dio.fetch(options);
            return handler.resolve(retryResponse);
          } catch (e) {
            return handler.reject(err);
          }
        } else {
          return handler.reject(DioException(
            requestOptions: err.requestOptions,
            error: 'Refresh token invalid or expired',
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
      return null;
    }
  }
}
