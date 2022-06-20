import 'package:bloc/bloc.dart';
import 'package:erp_fronted/quotation/models/quotation_model.dart';
import 'package:erp_fronted/src/resources/get_object.dart';

import 'list_quotation_event.dart';
import 'list_quotation_state.dart';

class ListQuotationBloc extends Bloc<ListQuotationEvent, ListQuotationState> {
  ListQuotationBloc() : super(ListQuotationState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<ListQuotationState> emit) async {
    final url = preDefinedUri('/api/quotations/');
    print(url);
    final quotations = await getObject(url, Quotations.serializer);

    print(quotations);
  }
}
