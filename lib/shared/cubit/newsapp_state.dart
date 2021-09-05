part of 'newsapp_cubit.dart';

@immutable
abstract class NewsappState {}

class NewsappInitial extends NewsappState {}

class AppChangeBottomNavBarState extends NewsappState {}

class AppChangeModeState extends NewsappState {}

class GetBusinessLoudingState extends NewsappState {}

class GetBusinessSucessesState extends NewsappState {}

class GetBusinessErrorState extends NewsappState {
  final String error;
  GetBusinessErrorState(this.error);
}

class GetsportLoudingState extends NewsappState {}

class GetsportSucessesState extends NewsappState {}

class GetsportErrorState extends NewsappState {
  final String error;
  GetsportErrorState(this.error);
}

class GetScienceLoudingState extends NewsappState {}

class GetScienceSucessesState extends NewsappState {}

class GetScienceErrorState extends NewsappState {
  final String error;
  GetScienceErrorState(this.error);
}

class GetSearchLoudingState extends NewsappState {}

class GetSearchSucessesState extends NewsappState {}

class GetSearchErrorState extends NewsappState {
  final String error;
  GetSearchErrorState(this.error);
}

class FinishSearchState extends NewsappState {}
