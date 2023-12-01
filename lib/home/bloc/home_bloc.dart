import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../core/names.dart';

part "home_state.dart";
part "home_event.dart";

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeStateInitial()) {
    on<HomeEventAdd>(_addName);
    on<HomeEventUpdate>(_updateName);
    on<HomeEventRemove>(_removeName);
    on<HomeEventRead>(_readNames);
  }

  FutureOr<void> _addName(HomeEventAdd event, Emitter<HomeState> emit) {
    final stateCurrent = state;
    if (stateCurrent is HomeStateDataLoaded) {
      final names = [...stateCurrent.names];

      names.add(event.name);

      emit(HomeStateDataLoaded(names: names));
    }
  }

  FutureOr<void> _updateName(HomeEventUpdate event, Emitter<HomeState> emit) {}

  FutureOr<void> _removeName(HomeEventRemove event, Emitter<HomeState> emit) {
    final stateCurrent = state;
    if (stateCurrent is HomeStateDataLoaded) {
      final names = [...stateCurrent.names];

      names.removeAt(event.index);

      emit(HomeStateDataLoaded(names: names));
    }
  }

  FutureOr<void> _readNames(HomeEventRead event, Emitter<HomeState> emit) {
    print('Aqui');
    final names = Names.names;

    emit(HomeStateDataLoaded(names: names));
  }
}
