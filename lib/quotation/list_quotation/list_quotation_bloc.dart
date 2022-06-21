import 'package:bloc/bloc.dart';
import 'package:erp_fronted/quotation/models/quotation_model.dart';
import 'package:erp_fronted/src/resources/get_object.dart';

import 'list_quotation_event.dart';
import 'list_quotation_state.dart';

class ListQuotationBloc extends Bloc<ListQuotationEvent, ListQuotationState> {
  ListQuotationBloc() : super(const ListQuotationState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<ListQuotationState> emit) async {
    emit(state.loadedInfo(state: States.loading));

    final url = preDefinedUri('/api/quotations/');
    try {
      final quotations = await getObject(url, Quotations.serializer);
      emit(state.loadedInfo(state: States.loaded, quotations: quotations));
    } catch (e) {
      emit(state.error(errorMessage: e.toString()));
    }
  }
}
