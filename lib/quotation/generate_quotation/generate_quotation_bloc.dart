import 'package:bloc/bloc.dart';

import 'generate_quotation_event.dart';
import 'generate_quotation_state.dart';

class GenerateQuotationBloc extends Bloc<GenerateQuotationEvent, GenerateQuotationState> {
  GenerateQuotationBloc() : super(GenerateQuotationState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<GenerateQuotationState> emit) async {
    emit(state.clone());
  }
}
