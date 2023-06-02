part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final UserModel userData;
  final List<TransactionModel> transactions;

  HomeLoadedState(this.userData, this.transactions);
}

class HomeErrorState extends HomeState {
  final String e;

  HomeErrorState(this.e);
}
