import 'dart:async';

import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomePageUpdateEvent>(homePageUpdateEvent);
    on<HomePageRefreshEvent>(homePageRefreshEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) {
    emit(HomeLoadingState());
    try {
      emit(HomeLoadedState());
    } catch (e) {
      HomeErrorState(e.toString());
    }
  }

  FutureOr<void> homePageUpdateEvent(
      HomePageUpdateEvent event, Emitter<HomeState> emit) {
    emit(HomeLoadingState());
    emit(HomeLoadedState());
  }

  Future<FutureOr<void>> homePageRefreshEvent(
      HomePageRefreshEvent event, Emitter<HomeState> emit)  async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    emit(HomeLoadedState());
  }
}
