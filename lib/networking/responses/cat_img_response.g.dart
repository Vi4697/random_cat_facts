// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_img_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatImagesResponse _$CatImagesResponseFromJson(Map<String, dynamic> json) =>
    CatImagesResponse(
      (json['url'] as List<dynamic>)
          .map((e) => e == null
              ? null
              : CatImageResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

CatImageResponse _$CatImageResponseFromJson(Map<String, dynamic> json) =>
    CatImageResponse(
      json['url'] as String,
    );
