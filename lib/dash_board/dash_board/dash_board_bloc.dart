import 'package:bloc/bloc.dart';

import 'dash_board_event.dart';
import 'dash_board_state.dart';

class DashBoardBloc extends Bloc<DashBoardEvent, DashBoardState> {
  DashBoardBloc() : super(DashBoardState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<DashBoardState> emit) async {
    emit(state.clone());
  }
}
