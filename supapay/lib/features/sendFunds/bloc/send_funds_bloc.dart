import 'dart:async';

import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:supapay/features/sendFunds/repository/send_funds_api.dart';

part 'send_funds_event.dart';
part 'send_funds_state.dart';

class SendFundsBloc extends Bloc<SendFundsEvent, SendFundsState> {
  SendFundsBloc() : super(SendFundsInitial()) {
    on<SendFundsProcessingEvent>(sendFundsProcessingEvent);
  }

  FutureOr<void> sendFundsProcessingEvent(
      SendFundsProcessingEvent event, Emitter<SendFundsState> emit) async {
    emit(SendFundsLoadingState());
    try {
      String response = await addTransaction(event.accNumber, event.amount);
      emit(SendFundsSuccessState(response));
    } catch (e) {      
      emit(SendFundsErrorState());
    }
  }
}
