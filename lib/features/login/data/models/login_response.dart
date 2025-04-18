import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: '_id')
  String id;
  @JsonKey(name: 'access_token')
  String accessToken;
  @JsonKey(name: 'refresh_token')
  String refreshToken;

  LoginResponse({
    required this.id,
    required this.accessToken,
    required this.refreshToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
