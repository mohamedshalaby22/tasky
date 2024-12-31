import 'dart:io';
import 'package:dio/dio.dart';
import 'package:tasky/core/networking/api_constants.dart';
import 'package:tasky/core/networking/api_result.dart';
import 'package:tasky/core/networking/dio_factory.dart';
import 'package:tasky/features/new_task/data/apis/new_task_api_constants.dart';
import 'package:tasky/features/new_task/data/apis/new_task_api_service.dart';
import 'package:tasky/features/new_task/data/models/new_task_request_body.dart';
import 'package:tasky/features/new_task/data/models/new_task_response.dart';
import 'package:tasky/features/new_task/data/models/upload_image_response.dart';
import '../../../../core/helpers/token_storage.dart';

class NewTaskRepo {
  final NewTaskApiService _newTaskApiService;
  NewTaskRepo(this._newTaskApiService);
  Future<ApiResult<AddNewTaskResponse>> addNewTask(
      AddNewTaskRequestBody addNewTaskRequestBody) async {
    try {
      final reponse =
          await _newTaskApiService.addNewTask(addNewTaskRequestBody);
      return ApiResult.success(reponse);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult<UploadImageResponse>> uploadImage(File imageFile) async {
    try {
      final formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(
          imageFile.path,
          filename: imageFile.uri.pathSegments.last,
          contentType: DioMediaType(
            'image',
            imageFile.path.endsWith('.png') ? 'png' : 'jpeg',
          ),
        ),
      });

      final dio = DioFactory.getDio();
      String? accessToken = await TokenStorage.getAccessToken();
      if (accessToken == null) {
        return const ApiResult.failure('No access token found');
      }
      dio.options.headers['Authorization'] = 'Bearer $accessToken';
      final response = await dio.post(
        '${ApiConstants.apiBaseUrl}${NewTaskApiConstants.uploadImage}',
        data: formData,
      );

      return ApiResult.success(UploadImageResponse.fromJson(response.data));
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}
/*
Future<ApiResult<UploadImageResponse>> uploadImage(File imageFile) async {
    try {
      final formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(
          imageFile.path,
          filename: imageFile.uri.pathSegments.last,
          contentType: DioMediaType(
            'image',
            imageFile.path.endsWith('.png') ? 'png' : 'jpeg',
          ),
        ),
      });

      final dio = DioFactory.getDio();
      final token = await TokenStorage.getAccessToken();
      dio.options.headers = {'Authorization': 'Bearer $token'};
      final response = await dio.post(
        'https://todo.iraqsapp.com/upload/image',
        data: formData,
        options: Options(
          method: 'POST',
          validateStatus: (status) => true,
        ),
      );

      if (response.statusCode == 200) {
        final result = UploadImageResponse.fromJson(response.data);

        return ApiResult.success(result);
      } else {
        return ApiResult.failure(
          "Error: ${response.statusMessage} (${response.statusCode})",
        );
      }
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
*/




