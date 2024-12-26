import 'package:tasky/core/networking/api_result.dart';
import 'package:tasky/features/new_task/data/apis/new_task_api_service.dart';
import 'package:tasky/features/new_task/data/models/new_task_request_body.dart';
import 'package:tasky/features/new_task/data/models/new_task_response.dart';

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
}
