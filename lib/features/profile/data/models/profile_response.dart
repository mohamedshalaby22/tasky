import 'package:json_annotation/json_annotation.dart';
part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse {
  String id;
  @JsonKey(name: 'displayName')
  String userName;
  @JsonKey(name: 'username')
  String phoneNumber;
  int experienceYears;
  String address;
  String level;

  ProfileResponse({
    this.id = '',
    this.userName = '',
    this.phoneNumber = '',
    this.experienceYears = 0,
    this.address = '',
    this.level = '',
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);
}
