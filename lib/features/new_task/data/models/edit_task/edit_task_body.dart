import 'package:json_annotation/json_annotation.dart';
part 'edit_task_body.g.dart';
@JsonSerializable()
class EditTaskRequestBody {
  String image;
  String title;
  String desc;
  String priority;
  String status;
  EditTaskRequestBody(
      {required this.image,
      required this.title,
      required this.desc,
      required this.priority,
      required this.status,});
  Map<String, dynamic> toJson() => _$EditTaskRequestBodyToJson(this);
}
