import 'package:bloc/bloc.dart';
import 'package:erp_fronted/product/models/product_model.dart';
import 'package:erp_fronted/src/resources/get_object.dart';

import 'warehouse_product_event.dart';
import 'warehouse_product_state.dart';

class WarehouseProductBloc extends Bloc<WarehouseProductEvent, WarehouseProductState> {
  WarehouseProductBloc() : super(const WarehouseProductState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<WarehouseProductState> emit) async {
    emit(state.loadedData(state: States.loading));

    final url = preDefinedUri('/api/entries/warehouseProduct/${event.warehouseId}');
    print(event.warehouseId);
    try {
      final products = await getObject(url, Products.serializer);
      emit(state.loadedData(state: States.loaded, products: products));
    } catch (e) {
      emit(state.error(errorMessage: e.toString()));
    }
  }
}
