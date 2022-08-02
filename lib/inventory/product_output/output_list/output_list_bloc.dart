import 'package:bloc/bloc.dart';

import 'output_list_event.dart';
import 'output_list_state.dart';

class OutputListBloc extends Bloc<OutputListEvent, OutputListState> {
  OutputListBloc() : super(OutputListState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<OutputListState> emit) async {
    emit(state.clone());
  }
}
