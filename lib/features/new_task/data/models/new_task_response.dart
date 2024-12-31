import 'package:freezed_annotation/freezed_annotation.dart';
part 'new_task_response.g.dart';

@JsonSerializable()
class AddNewTaskResponse {
  String image;
  String title;
  String desc;
  String priority;
  String status;
  String user;
  @JsonKey(name: '_id')
  String id;
  @JsonKey(name: 'createdAt')
  String dueDate;

  AddNewTaskResponse({
    required this.image,
    required this.title,
    required this.desc,
    required this.priority,
    required this.status,
    required this.user,
    required this.id,
    required this.dueDate,
  });

  factory AddNewTaskResponse.fromJson(Map<String, dynamic> json) =>
      _$AddNewTaskResponseFromJson(json);
}
