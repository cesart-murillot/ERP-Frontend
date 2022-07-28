import 'package:bloc/bloc.dart';
import 'package:erp_fronted/invoice/models/invoice_model.dart';
import 'package:erp_fronted/src/resources/get_object.dart';

import 'invoice_list_event.dart';
import 'invoice_list_state.dart';

class InvoiceListBloc extends Bloc<InvoiceListEvent, InvoiceListState> {
  InvoiceListBloc() : super(const InvoiceListState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<InvoiceListState> emit) async {
    emit(state.clone(state: States.loading));

    final url = preDefinedUri('/api/invoices');
    try {
      final Invoices invoices = await getObject(url, Invoices.serializer);
      emit(state.clone(state: States.loaded, invoices: invoices));
    } catch (e) {
      emit(state.error(errorMessage: e.toString()));
    }
  }
}
