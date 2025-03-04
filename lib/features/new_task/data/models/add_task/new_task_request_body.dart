import 'package:json_annotation/json_annotation.dart';
part 'new_task_request_body.g.dart';
@JsonSerializable()
class AddNewTaskRequestBody {
  String image;
  String title;
  String desc;
  String priority;
  String dueDate;
  AddNewTaskRequestBody(
      {required this.image,
      required this.title,
      required this.desc,
      required this.priority,
      required this.dueDate,});
  Map<String, dynamic> toJson() => _$AddNewTaskRequestBodyToJson(this);
}
