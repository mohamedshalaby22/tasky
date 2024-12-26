import 'package:json_annotation/json_annotation.dart';
part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse {
  String id;
  String displayName;
  @JsonKey(name: 'username')
  String phoneNumber;
  String experienceYears;
  String address;
  String level;

  ProfileResponse({
     this.id='',
     this.displayName='',
     this.phoneNumber='',
     this.experienceYears='',
     this.address='',
     this.level='',
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);
}
