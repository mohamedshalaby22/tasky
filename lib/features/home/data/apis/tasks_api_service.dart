import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tasky/core/networking/api_constants.dart';
import 'package:tasky/features/home/data/apis/tasks_api_constanst.dart';
import 'package:tasky/features/home/data/models/tasks_list_response.dart';

import '../models/logout_request_body.dart';
import '../models/logout_response.dart';
part 'tasks_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class TasksApiService {
  factory TasksApiService(Dio dio) => _TasksApiService(dio);
  // All Tasks
  @GET(TasksApiConstanst.todos)
  Future<List<TasksListResponse>> getTodos(@Query("page") int page);

  // logout
  @POST(TasksApiConstanst.logout)
  Future<LogoutResponse> logout(
    @Body() LogoutRequestBody logoutRequestBody,
  );
}
