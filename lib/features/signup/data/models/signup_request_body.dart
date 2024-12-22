import 'package:json_annotation/json_annotation.dart';
part 'signup_request_body.g.dart';

@JsonSerializable()
class SignupRequestBody {
  String phone;
  String password;
  String displayName;
  String experienceYears;
  String address;
  String level;
  SignupRequestBody(
      {required this.phone,
      required this.password,
      required this.displayName,
      required this.experienceYears,
      required this.address,
      required this.level});
  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);
}
