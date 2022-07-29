import 'package:flutter/material.dart';
import 'package:random_cat_facts/networking/api_services/api_service.dart';
import 'package:random_cat_facts/networking/responses/cat_img_response.dart';

class ImageRepository {
  final ImageApiClient imageApiClient;

  ImageRepository({
    required this.imageApiClient,
  });

  Future<List<CatImageResponse?>> getRamdomImage() async {
    return await imageApiClient.getImage();
  }
}
