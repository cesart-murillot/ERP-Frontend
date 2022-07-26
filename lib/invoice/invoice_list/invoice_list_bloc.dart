import 'package:bloc/bloc.dart';

import 'invoice_list_event.dart';
import 'invoice_list_state.dart';

class InvoiceListBloc extends Bloc<InvoiceListEvent, InvoiceListState> {
  InvoiceListBloc() : super(InvoiceListState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<InvoiceListState> emit) async {
    emit(state.clone());
  }
}
