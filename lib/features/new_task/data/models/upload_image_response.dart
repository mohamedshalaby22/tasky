import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_image_response.g.dart';

@JsonSerializable()
class UploadImageResponse {
  String image;
  UploadImageResponse({
    required this.image,
  });

  factory UploadImageResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadImageResponseFromJson(json);
}
