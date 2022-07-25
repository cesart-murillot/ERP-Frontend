import 'package:bloc/bloc.dart';
import 'package:erp_fronted/branch/models/warehouse_model.dart';
import 'package:erp_fronted/src/resources/get_object.dart';

import 'warehouse_search_state.dart';

class WarehouseSearchCubit extends Cubit<WarehouseSearchState> {
  WarehouseSearchCubit() : super(const WarehouseSearchState().init());

  Future<void> getWarehouses() async {
    emit(state.clone(state: States.loading));

    final Uri url = preDefinedUri('/api/warehouses/', {'type': 'branch'});

    try {
      final warehouses = await getObject(url, Warehouses.serializer);

      emit(state.clone(state: States.loaded, warehouses: warehouses));
    } catch (e) {
      emit(state.error(errorMessage: e.toString()));
    }
  }

}
