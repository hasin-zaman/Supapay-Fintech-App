part of 'send_funds_bloc.dart';

@immutable
abstract class SendFundsEvent {}

class SendFundsProcessingEvent extends SendFundsEvent {
  final int amount;
  final String accNumber;

  SendFundsProcessingEvent(this.amount, this.accNumber);
}