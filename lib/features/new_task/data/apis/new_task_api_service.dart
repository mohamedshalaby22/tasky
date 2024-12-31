import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tasky/core/networking/api_constants.dart';
import 'package:tasky/features/new_task/data/apis/new_task_api_constants.dart';
import 'package:tasky/features/new_task/data/models/new_task_request_body.dart';
import 'package:tasky/features/new_task/data/models/new_task_response.dart';
part 'new_task_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class NewTaskApiService {
  factory NewTaskApiService(Dio dio) = _NewTaskApiService;

  @POST(NewTaskApiConstants.newTask)
  Future<AddNewTaskResponse> addNewTask(
    @Body() AddNewTaskRequestBody addNewTaskRequestBody,
  );
}
