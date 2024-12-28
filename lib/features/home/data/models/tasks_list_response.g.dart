// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TasksListResponse _$TasksListResponseFromJson(Map<String, dynamic> json) =>
    TasksListResponse(
      id: json['_id'] as String? ?? '',
      image: json['image'] as String? ?? '',
      title: json['title'] as String? ?? '',
      desc: json['desc'] as String? ?? '',
      priority: json['priority'] as String? ?? '',
      status: json['status'] as String? ?? '',
      dueDate: json['createdAt'] as String? ?? '',
    );

Map<String, dynamic> _$TasksListResponseToJson(TasksListResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'image': instance.image,
      'title': instance.title,
      'desc': instance.desc,
      'priority': instance.priority,
      'status': instance.status,
      'createdAt': instance.dueDate,
    };
