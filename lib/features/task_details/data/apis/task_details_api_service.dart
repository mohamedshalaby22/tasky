import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tasky/core/networking/api_constants.dart';
import 'package:tasky/features/task_details/data/apis/task_details_api_constants.dart';
import 'package:tasky/features/task_details/data/models/task_details_response.dart';
part 'task_details_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class TaskDetailsApiService {
  factory TaskDetailsApiService(Dio dio) = _TaskDetailsApiService;

  @GET('${TaskDetailsApiConstants.taskDetails}/{taskId}')
  Future<TaskDetailsResponse> getTaskDetails(@Path('taskId') String taskId);
}
