import 'package:freezed_annotation/freezed_annotation.dart';
part 'logout_response.g.dart';

@JsonSerializable()
class LogoutResponse {
  bool success;

  LogoutResponse({
    this.success = false,
  });

  factory LogoutResponse.fromJson(Map<String, dynamic> json) =>
      _$LogoutResponseFromJson(json);
}
