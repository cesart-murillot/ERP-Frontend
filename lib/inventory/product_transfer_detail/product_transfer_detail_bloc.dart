import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:erp_fronted/product_request/models/transfer_model.dart';
import 'package:erp_fronted/src/resources/get_object.dart';
import 'package:erp_fronted/src/resources/post_object.dart';

import 'product_transfer_detail_event.dart';
import 'product_transfer_detail_state.dart';

class ProductTransferDetailBloc
    extends Bloc<ProductTransferDetailEvent, ProductTransferDetailState> {
  ProductTransferDetailBloc()
      : super(const ProductTransferDetailState().init()) {
    on<InitEvent>(_init);
    on<GenerateShipmentOrderEvent>(_generateShipmentOrder);
  }

  void _init(InitEvent event, Emitter<ProductTransferDetailState> emit) async {
    emit(state.loadedData(state: States.loading));
    final url = preDefinedUri('/api/transfers/${event.transferId}');
    try {
      final Transfer transfer = await getObject(url, Transfer.serializer);
      emit(state.loadedData(state: States.loaded, transfer: transfer));
    } catch (e) {
      emit(state.error(errorMessage: e.toString()));
    }
  }

  Future<FutureOr<void>> _generateShipmentOrder(
    ProductTransferDetailEvent event,
    Emitter<ProductTransferDetailState> emit,
  ) async {
    final url = preDefinedUri('api/transfers/validate/${state.transfer?.id}');
    try {
      final String response = await postDataToApi(url, '');
    } catch (e) {
      print(e.toString());
    }
  }
}
