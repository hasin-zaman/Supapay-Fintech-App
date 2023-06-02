part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomePageUpdateEvent extends HomeEvent {
  final UserModel userData;
  final List<TransactionModel> transactions;

  HomePageUpdateEvent(this.userData, this.transactions);
}

class HomePageRefreshEvent extends HomeEvent {}
