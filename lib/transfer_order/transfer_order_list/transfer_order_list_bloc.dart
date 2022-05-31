import 'package:bloc/bloc.dart';
import 'package:erp_fronted/src/resources/generic_serializer.dart';
import 'package:erp_fronted/src/resources/get_object.dart';
import 'package:erp_fronted/transfer_order/models/transfer_order_model.dart';

import 'transfer_order_list_event.dart';
import 'transfer_order_list_state.dart';

class TransferOrderListBloc extends Bloc<TransferOrderListEvent, TransferOrderListState> {
  TransferOrderListBloc() : super(const TransferOrderListState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<TransferOrderListState> emit) async {
    final url = preDefinedUri('api/transfer_orders/');
    try {
      final TransferOrders transferOrders = await getObject(url, TransferOrders.serializer);
      emit(const TransferOrderListState().loadingData(state: States.loaded, transferOrders: transferOrders));
    } catch (e) {
      emit(const TransferOrderListState().error(e.toString()));
    }
  }
}
