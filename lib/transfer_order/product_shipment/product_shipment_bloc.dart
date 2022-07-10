import 'package:bloc/bloc.dart';
import 'package:erp_fronted/src/resources/get_object.dart';
import 'package:erp_fronted/transfer_order/models/transfer_order_model.dart';

import 'product_shipment_event.dart';
import 'product_shipment_state.dart';

class ProductShipmentBloc
    extends Bloc<ProductShipmentEvent, ProductShipmentState> {
  ProductShipmentBloc() : super(const ProductShipmentState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<ProductShipmentState> emit) async {
    emit(state.loadingData(state: States.loading));
    final url = preDefinedUri('api/transfer_orders/');
    try {
      final TransferOrders transferOrders =
          await getObject(url, TransferOrders.serializer);
      emit(state.loadingData(
          state: States.loaded, transferOrders: transferOrders));
    } catch (e) {
      emit(state.error(e.toString()));
    }
  }
}
