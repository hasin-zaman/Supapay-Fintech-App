part of 'transactions_bloc.dart';

@immutable
abstract class TransactionsState {}

class TransactionsInitial extends TransactionsState {}

class TransactionsLoadingState extends TransactionsState {}

class TransactionsLoadedState extends TransactionsState {
  final List<TransactionModel> transactions;

  TransactionsLoadedState(this.transactions);
}

class TransactionsErrorState extends TransactionsState {}
