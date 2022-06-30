import 'package:bloc/bloc.dart';
import 'package:erp_fronted/sale/models/sale_model.dart';
import 'package:erp_fronted/src/resources/get_object.dart';

import 'show_sale_event.dart';
import 'show_sale_state.dart';

class ShowSaleBloc extends Bloc<ShowSaleEvent, ShowSaleState> {
  ShowSaleBloc() : super(const ShowSaleState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<ShowSaleState> emit) async {
    emit(state.loadedData(state: States.loading));

    final url = preDefinedUri('/api/sales/${event.saleId}');
    final Sale sale = await getObject(url, Sale.serializer);

    emit(state.loadedData(state: States.loaded, sale: sale));
  }
}
