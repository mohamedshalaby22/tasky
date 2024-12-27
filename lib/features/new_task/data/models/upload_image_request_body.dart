
import 'package:freezed_annotation/freezed_annotation.dart';
part 'upload_image_request_body.g.dart';
@JsonSerializable()
class UploadImageRequestBody {
  String image;
  UploadImageRequestBody({required this.image});
  Map<String, dynamic> toJson() => _$UploadImageRequestBodyToJson(this);
}
