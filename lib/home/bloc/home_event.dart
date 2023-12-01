// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "home_bloc.dart";

abstract class HomeEvent {}

class HomeEventRead extends HomeEvent{}

class HomeEventAdd extends HomeEvent {
  final String name;
  HomeEventAdd({
    required this.name,
  });
}

class HomeEventUpdate extends HomeEvent {
  final String name;
  HomeEventUpdate({
    required this.name,
  });
}

class HomeEventRemove extends HomeEvent {
  final int index;
  HomeEventRemove({
    required this.index,
  });
}
