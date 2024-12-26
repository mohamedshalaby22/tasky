import 'package:tasky/core/networking/api_result.dart';
import 'package:tasky/features/home/data/apis/tasks_api_service.dart';
import 'package:tasky/features/home/data/models/tasks_list_response.dart';

class TasksRepo {
  final TasksApiService _todosApiService;
  TasksRepo(this._todosApiService);
  Future<ApiResult<List<TasksListResponse>>> getTodos() async {
    try {
      final response = await _todosApiService.getTodos(1);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}
