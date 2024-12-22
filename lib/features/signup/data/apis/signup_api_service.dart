import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tasky/core/networking/api_constants.dart';
import 'package:tasky/features/signup/data/apis/signup_api_constants.dart';
import 'package:tasky/features/signup/data/models/signup_request_body.dart';
import 'package:tasky/features/signup/data/models/signup_response.dart';
part 'signup_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class SignupApiService {
  factory SignupApiService(Dio dio) = _SignupApiService;

  @POST(SignupApiConstants.signup)
  Future<SignupResponse> signup(
    @Body() SignupRequestBody signupRequestBody,
  );
}
