// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_task_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddNewTaskRequestBody _$AddNewTaskRequestBodyFromJson(
        Map<String, dynamic> json) =>
    AddNewTaskRequestBody(
      image: json['image'] as String,
      title: json['title'] as String,
      des: json['des'] as String,
      priority: json['priority'] as String,
      dueDate: json['dueDate'] as String,
    );

Map<String, dynamic> _$AddNewTaskRequestBodyToJson(
        AddNewTaskRequestBody instance) =>
    <String, dynamic>{
      'image': instance.image,
      'title': instance.title,
      'des': instance.des,
      'priority': instance.priority,
      'dueDate': instance.dueDate,
    };
