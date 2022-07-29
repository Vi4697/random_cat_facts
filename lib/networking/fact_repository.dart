import 'package:flutter/material.dart';
import 'package:random_cat_facts/networking/api_services/api_service.dart';
import 'package:random_cat_facts/networking/responses/fact_response.dart';

class FactRepository {
  final FactApiClient factApiClient;

  FactRepository({
    required this.factApiClient,
  });

  Future<RandFactResponse?> getRamdomFact() async {
    return await factApiClient.getRandomFact();
  }
}
