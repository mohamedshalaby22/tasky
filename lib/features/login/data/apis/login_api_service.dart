import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tasky/core/networking/api_constants.dart';
import 'package:tasky/features/login/data/apis/login_api_constants.dart';
import 'package:tasky/features/login/data/models/login_request_body.dart';
import 'package:tasky/features/login/data/models/login_response.dart';
part 'login_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class LoginApiService {
  factory LoginApiService(Dio dio) = _LoginApiService;

  @POST(LoginApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );
  
}
