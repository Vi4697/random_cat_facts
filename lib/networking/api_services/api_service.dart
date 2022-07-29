import 'package:dio/dio.dart';
import 'package:random_cat_facts/networking/responses/cat_img_response.dart';
import 'package:random_cat_facts/networking/responses/fact_response.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://catfact.ninja")
abstract class FactApiClient {
  factory FactApiClient(Dio dio, {String baseUrl}) = _FactApiClient;

  @GET('/fact')
  Future<RandFactResponse?> getRandomFact();
}

@RestApi(baseUrl: "https://api.thecatapi.com")
abstract class ImageApiClient {
  factory ImageApiClient(Dio dio, {String baseUrl}) = _ImageApiClient;

  @GET('/v1/images/search')
  Future<List<CatImageResponse?>> getImage();
}
