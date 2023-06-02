part of 'send_funds_bloc.dart';

@immutable
abstract class SendFundsState {}

class SendFundsInitial extends SendFundsState {}

class SendFundsLoadingState extends SendFundsState {}

class SendFundsErrorState extends SendFundsState {}

class SendFundsSuccessState extends SendFundsState {
  final String response;

  SendFundsSuccessState(this.response);
}
