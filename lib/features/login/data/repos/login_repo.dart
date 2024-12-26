import 'package:tasky/core/networking/api_result.dart';
import 'package:tasky/features/login/data/apis/login_api_service.dart';
import 'package:tasky/features/login/data/models/login_request_body.dart';
import 'package:tasky/features/login/data/models/login_response.dart';

class LoginRepo {
  final LoginApiService _loginApiService;
  LoginRepo(this._loginApiService);
  Future<ApiResult<LoginResponse>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      final response = await _loginApiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }


}
