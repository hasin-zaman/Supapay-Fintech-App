part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomePageUpdateEvent extends HomeEvent {}

class HomePageRefreshEvent extends HomeEvent {}
