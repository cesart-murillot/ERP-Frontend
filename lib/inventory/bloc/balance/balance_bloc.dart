import 'package:bloc/bloc.dart';

import 'balance_event.dart';
import 'balance_state.dart';

class BalanceBloc extends Bloc<BalanceEvent, BalanceState> {
  BalanceBloc() : super(BalanceState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<BalanceState> emit) async {
    emit(state.clone());
  }
}
