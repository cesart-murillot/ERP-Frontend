import 'dart:async';

import 'package:bloc/bloc.dart';

import 'register_entry_order_event.dart';
import 'register_entry_order_state.dart';

class RegisterEntryOrderBloc extends Bloc<RegisterEntryOrderEvent, RegisterEntryOrderState> {
  RegisterEntryOrderBloc() : super(const InitState()) {
    on<InitEvent>(_init);
  }



  FutureOr<void> _init(InitEvent event, Emitter<RegisterEntryOrderState> emit) {
    print('hello workd');
  }
}
