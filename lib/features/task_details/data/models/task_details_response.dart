import 'package:freezed_annotation/freezed_annotation.dart';
part 'task_details_response.g.dart';

@JsonSerializable()
class TaskDetailsResponse {
  @JsonKey(name: '_id')
  String id;
  String image;
  String title;
  String desc;
  String priority;
  String status;
  @JsonKey(name: 'user')
  String userId;
  @JsonKey(name: 'createdAt')
  String dueDate;

  TaskDetailsResponse({
    required this.id,
    required this.image,
    required this.title,
    required this.desc,
    required this.priority,
    required this.status,
    required this.userId,
    required this.dueDate,
  });

  factory TaskDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$TaskDetailsResponseFromJson(json);
}
