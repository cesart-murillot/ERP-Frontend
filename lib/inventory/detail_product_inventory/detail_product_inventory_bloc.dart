import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:erp_fronted/entry/models/entry_model.dart';
import 'package:erp_fronted/product/models/product_model.dart';
import 'package:erp_fronted/src/resources/get_object.dart';

import 'detail_product_inventory_event.dart';
import 'detail_product_inventory_state.dart';

class DetailProductInventoryBloc extends Bloc<DetailProductInventoryEvent, DetailProductInventoryState> {
  DetailProductInventoryBloc() : super(const DetailProductInventoryState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<DetailProductInventoryState> emit) async {
    emit(state.loadedData(state: States.loading));
    try {
      final url = preDefinedUri('/api/entries/', {'product': '${event.productId}'});
      final Entries entries = await getObject(url, Entries.serializer);

      final productUrl = preDefinedUri('api/products/${event.productId}');
      final Product product = await getObject(productUrl, Product.serializer);

      emit(state.loadedData(state: States.loaded, product: product, entries: entries));
    } catch (e) {
      emit(state.error(errorMessage: e.toString()));
    }
  }
}

