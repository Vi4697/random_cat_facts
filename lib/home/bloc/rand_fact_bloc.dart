import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:random_cat_facts/database/fact_record.dart';
import 'package:random_cat_facts/main.dart';
import 'package:random_cat_facts/networking/api_services/api_service.dart';
import 'package:random_cat_facts/networking/fact_repository.dart';
import 'package:random_cat_facts/networking/image_repository.dart';
import 'package:random_cat_facts/networking/responses/cat_img_response.dart';
import 'package:random_cat_facts/networking/responses/fact_response.dart';

part 'rand_fact_event.dart';
part 'rand_fact_state.dart';

class FactEventPressed extends RandFactEvent {}

class FactBloc extends Bloc<RandFactEvent, RandFactState> {
  final FactRepository factRepository;
  final ImageRepository imageRepository;
  FactBloc({required this.factRepository, required this.imageRepository})
      : super(Initial()) {
    on<FactEventPressed>((event, emit) => _onEvent(event, emit));
  }

  _onEvent(RandFactEvent event, Emitter<RandFactState> emit) async {
    emit(Loading());
    try {
      RandFactResponse? fact = await factRepository.getRamdomFact();
      List<CatImageResponse?> images = await imageRepository.getRamdomImage();
      emit(Loaded(fact: fact!, image: images.first!));
      recordsService.addTask(FactRecord(
          creationDateTime: DateTime.now().millisecondsSinceEpoch,
          id: DateTime.now().millisecondsSinceEpoch,
          text: fact.fact));
    } catch (_) {
      emit(Failure());
    }
  }
}
