import 'package:bloc/bloc.dart';
import 'package:erp_fronted/product_request/models/transfer_model.dart';
import 'package:erp_fronted/src/resources/get_object.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'product_transfer_event.dart';
import 'product_transfer_state.dart';

class ProductTransferBloc extends Bloc<ProductTransferEvent, ProductTransferState> {
  ProductTransferBloc() : super(const ProductTransferState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<ProductTransferState> emit) async {
    emit(state.loadedData(state: States.loading));

    final url = preDefinedUri('/api/transfers/');
    try {
      final Transfers transfers = await getObject(url, Transfers.serializer);
      final prefs = await SharedPreferences.getInstance();
      final roleId = prefs.getInt('roleId');
      if (roleId != null) {
        emit(state.loadedData(state: States.loaded, transfers: transfers, roleId: roleId));
      }
      emit(state.loadedData(state: States.loaded, transfers: transfers));
    } catch (e) {
      emit(state.error(errorMessage: e.toString()));
    }
  }
}
