import 'package:bloc/bloc.dart';
import 'package:erp_fronted/quotation/models/quotation_model.dart';
import 'package:erp_fronted/src/resources/get_object.dart';

import 'show_quotation_event.dart';
import 'show_quotation_state.dart';

class ShowQuotationBloc extends Bloc<ShowQuotationEvent, ShowQuotationState> {
  ShowQuotationBloc() : super(const ShowQuotationState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<ShowQuotationState> emit) async {
    emit(state.loadingData(state: States.loading));
    final url = preDefinedUri('/api/quotations/${event.quotationId}');
    try {
      final quotation = await getObject(url, Quotation.serializer);
      emit(state.loadingData(state: States.loaded, quotation: quotation));
    } catch (e) {
      emit(state.error(error: e.toString()));
    }
  }
}
