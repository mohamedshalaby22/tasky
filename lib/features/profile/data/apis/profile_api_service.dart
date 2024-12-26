import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tasky/core/networking/api_constants.dart';
import '../models/profile_response.dart';
import 'profile_api_constants.dart';
part 'profile_api_service.g.dart';
@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ProfileApiService {
  factory ProfileApiService(Dio dio) => _ProfileApiService(dio);
  @GET(ProfileApiConstants.profile)
  Future<ProfileResponse> getProfile();
}
