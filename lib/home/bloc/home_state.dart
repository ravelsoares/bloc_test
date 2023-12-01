// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "home_bloc.dart";

abstract class HomeState {}

class HomeStateInitial extends HomeState {}

class HomeStateDataLoaded extends HomeState {
  List<String> names = [];
  HomeStateDataLoaded({
    required this.names,
  });
}
