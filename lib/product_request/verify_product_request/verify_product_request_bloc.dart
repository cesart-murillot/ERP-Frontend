import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:erp_fronted/product_request/models/transfer_model.dart';
import 'package:erp_fronted/src/resources/get_object.dart';
import 'package:erp_fronted/src/resources/post_object.dart';

import 'verify_product_request_event.dart';
import 'verify_product_request_state.dart';

class VerifyProductRequestBloc extends Bloc<VerifyProductRequestEvent, VerifyProductRequestState> {
  VerifyProductRequestBloc() : super(const VerifyProductRequestState().init()) {
    on<InitEvent>(_init);
    on<GenerateShipmentOrderEvent>(_generateShipmentOrder);
  }

  void _init(InitEvent event, Emitter<VerifyProductRequestState> emit) async {

    emit(const VerifyProductRequestState().loadedInfo(state: States.loading, transfer: null));
    final url = preDefinedUri('/api/transfers/${event.transferId}');
    final Transfer transfer = await getObject(url, Transfer.serializer);

    emit(const VerifyProductRequestState().loadedInfo(state: States.loaded, transfer: transfer));

  }

  Future<FutureOr<void>> _generateShipmentOrder(GenerateShipmentOrderEvent event, Emitter<VerifyProductRequestState> emit) async {
    final url = preDefinedUri('api/transfers/validate/${state.transfer?.id}');

    try {
      final String response = await postDataToApi(url, '');
    } catch (e) {
      print(e);
    }
  }
}
