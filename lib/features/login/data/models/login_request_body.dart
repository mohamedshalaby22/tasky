import 'package:json_annotation/json_annotation.dart';
part 'login_request_body.g.dart';

@JsonSerializable()
class LoginRequestBody {
  String phone;
  String password;
  LoginRequestBody(
      {required this.phone,
      required this.password,});
  Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);
}
