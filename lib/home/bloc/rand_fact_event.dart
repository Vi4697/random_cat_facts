part of 'rand_fact_bloc.dart';

@immutable
abstract class RandFactEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class RequestFact extends RandFactEvent {}
