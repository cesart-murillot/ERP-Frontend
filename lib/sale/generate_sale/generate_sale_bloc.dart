import 'package:bloc/bloc.dart';

import 'generate_sale_event.dart';
import 'generate_sale_state.dart';

class GenerateSaleBloc extends Bloc<GenerateSaleEvent, GenerateSaleState> {
  GenerateSaleBloc() : super(GenerateSaleState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<GenerateSaleState> emit) async {
    emit(state.clone());
  }
}
