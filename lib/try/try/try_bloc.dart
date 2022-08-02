import 'package:bloc/bloc.dart';

import 'try_event.dart';
import 'try_state.dart';

class TryBloc extends Bloc<TryEvent, TryState> {
  TryBloc() : super(TryState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<TryState> emit) async {
    emit(state.clone());
  }
}
