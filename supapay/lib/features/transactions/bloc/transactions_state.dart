part of 'transactions_bloc.dart';

@immutable
abstract class TransactionsState {}

class TransactionsInitial extends TransactionsState {}

class TransactionsLoadingState extends TransactionsState {}

class TransactionsLoadedState extends TransactionsState {}

class TransactionsErrorState extends TransactionsState {}
