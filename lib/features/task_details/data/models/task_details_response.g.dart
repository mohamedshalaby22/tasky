// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskDetailsResponse _$TaskDetailsResponseFromJson(Map<String, dynamic> json) =>
    TaskDetailsResponse(
      id: json['_id'] as String,
      image: json['image'] as String,
      title: json['title'] as String,
      desc: json['desc'] as String,
      priority: json['priority'] as String,
      status: json['status'] as String,
      userId: json['user'] as String,
      dueDate: json['createdAt']as String,
    );

