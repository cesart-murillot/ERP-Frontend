import 'package:bloc/bloc.dart';

import 'try_hard_event.dart';
import 'try_hard_state.dart';

class TryHardBloc extends Bloc<TryHardEvent, TryHardState> {
  TryHardBloc() : super(TryHardState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<TryHardState> emit) async {
    emit(state.clone());
  }
}
