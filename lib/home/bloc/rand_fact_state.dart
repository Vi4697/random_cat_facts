part of 'rand_fact_bloc.dart';

@immutable
abstract class RandFactState extends Equatable {
  @override
  List<Object> get props => [];
}

class Initial extends RandFactState {}

class Loading extends RandFactState {}

class Loaded extends RandFactState {
  final CatImageResponse image;
  final RandFactResponse fact;
  Loaded({required this.fact, required this.image});
  @override
  List<Object> get props => [fact, image];
}

class Failure extends RandFactState {}
