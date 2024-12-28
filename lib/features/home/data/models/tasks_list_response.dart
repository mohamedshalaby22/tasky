import 'package:freezed_annotation/freezed_annotation.dart';
part 'tasks_list_response.g.dart';

@JsonSerializable()
class TasksListResponse {
  @JsonKey(name: '_id')
  String id;
  String image;
  String title;
  String desc;
  String priority;
  String status;
  @JsonKey(name: 'createdAt')
  String dueDate;

  TasksListResponse({
    this.id = '',
    this.image = '',
    this.title = '',
    this.desc = '',
    this.priority = '',
    this.status = '',
    this.dueDate = '',
  });

  factory TasksListResponse.fromJson(Map<String, dynamic> json) =>
      _$TasksListResponseFromJson(json);
}
