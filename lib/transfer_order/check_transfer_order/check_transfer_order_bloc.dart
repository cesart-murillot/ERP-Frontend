import 'package:bloc/bloc.dart';
import 'package:erp_fronted/src/resources/get_object.dart';
import 'package:erp_fronted/transfer_order/models/transfer_order_model.dart';

import 'check_transfer_order_event.dart';
import 'check_transfer_order_state.dart';

class CheckTransferOrderBloc
    extends Bloc<CheckTransferOrderEvent, CheckTransferOrderState> {
  CheckTransferOrderBloc() : super(const CheckTransferOrderState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<CheckTransferOrderState> emit) async {
    emit(const CheckTransferOrderState().loadingData(state: States.loading));
    final url = preDefinedUri('/api/transfer_orders/${event.transferOrderId}');
    try {
      final TransferOrder transferOrder = await getObject(url, TransferOrder.serializer);
      emit(const CheckTransferOrderState()
          .loadingData(state: States.loaded, transferOrder: transferOrder));
    } catch (e) {
      emit(const CheckTransferOrderState().error(e.toString()));
    }
  }
}
