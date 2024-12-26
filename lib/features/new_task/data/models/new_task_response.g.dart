// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_task_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddNewTaskResponse _$AddNewTaskResponseFromJson(Map<String, dynamic> json) =>
    AddNewTaskResponse(
      image: json['image'] as String,
      title: json['title'] as String,
      desc: json['desc'] as String,
      priority: json['priority'] as String,
      status: json['status'] as String,
      user: json['user'] as String,
      id: json['id'] as String,
      dueDate: json['createdAt'] as String,
    );

Map<String, dynamic> _$AddNewTaskResponseToJson(AddNewTaskResponse instance) =>
    <String, dynamic>{
      'image': instance.image,
      'title': instance.title,
      'desc': instance.desc,
      'priority': instance.priority,
      'status': instance.status,
      'user': instance.user,
      'id': instance.id,
      'createdAt': instance.dueDate,
    };
