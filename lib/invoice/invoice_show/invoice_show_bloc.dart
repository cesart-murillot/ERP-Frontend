import 'package:bloc/bloc.dart';

import 'invoice_show_event.dart';
import 'invoice_show_state.dart';

class InvoiceShowBloc extends Bloc<InvoiceShowEvent, InvoiceShowState> {
  InvoiceShowBloc() : super(InvoiceShowState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<InvoiceShowState> emit) async {
    emit(state.clone());
  }
}
