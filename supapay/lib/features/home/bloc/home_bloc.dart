import 'dart:async';

import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:supapay/features/home/models/transaction_model.dart';

import '../models/user_model.dart';
import '../repository/user_data.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomePageUpdateEvent>(homePageUpdateEvent);
    on<HomePageRefreshEvent>(homePageRefreshEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    try {
      final userData = await fetchUser();
      final transactions = await fetchTransactions();
      emit(HomeLoadedState(userData, transactions));
    } catch (e) {
      HomeErrorState(e.toString());
    }
  }

  FutureOr<void> homePageUpdateEvent(
      HomePageUpdateEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadedState(event.userData, event.transactions));
  }

  Future<FutureOr<void>> homePageRefreshEvent(
      HomePageRefreshEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    final userData = await fetchUser();
    final transactions = await fetchTransactions();
    emit(HomeLoadedState(userData, transactions));
  }
}
