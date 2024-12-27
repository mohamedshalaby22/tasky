// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) =>
    ProfileResponse(
      id: json['id'] as String? ?? '',
      userName: json['displayName'] as String? ?? '',
      phoneNumber: json['username'] as String? ?? '',
      experienceYears: (json['experienceYears'] as num?)?.toInt() ?? 0,
      address: json['address'] as String? ?? '',
      level: json['level'] as String? ?? '',
    );

Map<String, dynamic> _$ProfileResponseToJson(ProfileResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.userName,
      'username': instance.phoneNumber,
      'experienceYears': instance.experienceYears,
      'address': instance.address,
      'level': instance.level,
    };
