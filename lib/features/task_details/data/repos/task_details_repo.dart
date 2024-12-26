import 'package:tasky/core/networking/api_result.dart';
import 'package:tasky/features/task_details/data/apis/task_details_api_service.dart';
import 'package:tasky/features/task_details/data/models/task_details_response.dart';

class TaskDetailsRepo {
  final TaskDetailsApiService _taskDetailsApiService;
  TaskDetailsRepo(this._taskDetailsApiService);
  Future<ApiResult<TaskDetailsResponse>> getTaskDetails(
      {required String taskId}) async {
    try {
      final response = await _taskDetailsApiService.getTaskDetails(taskId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}
