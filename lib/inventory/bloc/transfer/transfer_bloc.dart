import 'package:bloc/bloc.dart';

import 'transfer_event.dart';
import 'transfer_state.dart';

class TransferBloc extends Bloc<TransferEvent, TransferState> {
  TransferBloc() : super(TransferState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<TransferState> emit) async {
    emit(state.clone());
  }
}
