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

  TaskDetailsResponse({
    this.id = '',
    this.image = '',
    this.title = '',
    this.desc = '',
    this.priority = '',
    this.status = '',
    this.userId = '',
  });

  factory TaskDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$TaskDetailsResponseFromJson(json);
}
