import 'dart:async';

import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:supapay/features/home/models/transaction_model.dart';
import 'package:supapay/features/transactions/repository/transaction_data.dart';

part 'transactions_event.dart';
part 'transactions_state.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  TransactionsBloc() : super(TransactionsInitial()) {
    on<TransactionsIntialEvent>(transactionsIntialEvent);
  }

  FutureOr<void> transactionsIntialEvent(
      TransactionsIntialEvent event, Emitter<TransactionsState> emit) async {
    emit(TransactionsLoadingState());
    try {
      final transactions = await fetchAllTransactions();
      emit(TransactionsLoadedState(transactions));
    } catch (e) {
      emit(TransactionsErrorState());
    }
  }
}
