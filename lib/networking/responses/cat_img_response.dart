import 'package:json_annotation/json_annotation.dart';

part 'cat_img_response.g.dart';

@JsonSerializable(createToJson: false)
class CatImagesResponse {
  @JsonKey(name: 'url')
  final List<CatImageResponse?> imageUrl;

  const CatImagesResponse(this.imageUrl);

  factory CatImagesResponse.fromJson(Map<String, dynamic> json) =>
      _$CatImagesResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class CatImageResponse {
  @JsonKey(name: 'url')
  final String imageUrl;

  const CatImageResponse(this.imageUrl);

  factory CatImageResponse.fromJson(Map<String, dynamic> json) =>
      _$CatImageResponseFromJson(json);
}
