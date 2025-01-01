import 'package:freezed_annotation/freezed_annotation.dart';
part 'edit_task_response.g.dart';
@JsonSerializable()
class EditTaskResponse {
  String image;
  String title;
  String desc;
  String priority;
  String status;

  EditTaskResponse({
    required this.image,
    required this.title,
    required this.desc,
    required this.priority,
    required this.status,
  });

  factory EditTaskResponse.fromJson(Map<String, dynamic> json) =>
      _$EditTaskResponseFromJson(json);
}
