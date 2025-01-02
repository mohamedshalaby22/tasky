// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_task_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditTaskRequestBody _$EditTaskRequestBodyFromJson(Map<String, dynamic> json) =>
    EditTaskRequestBody(
      image: json['image'] as String,
      title: json['title'] as String,
      desc: json['desc'] as String,
      priority: json['priority'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$EditTaskRequestBodyToJson(
        EditTaskRequestBody instance) =>
    <String, dynamic>{
      'image': instance.image,
      'title': instance.title,
      'desc': instance.desc,
      'priority': instance.priority,
      'status': instance.status,
    };
