import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'send_funds_event.dart';
part 'send_funds_state.dart';

class SendFundsBloc extends Bloc<SendFundsEvent, SendFundsState> {
  SendFundsBloc() : super(SendFundsInitial()) {
    on<SendFundsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
