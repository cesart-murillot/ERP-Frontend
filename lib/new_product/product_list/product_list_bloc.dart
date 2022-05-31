import 'package:bloc/bloc.dart';
import 'package:erp_fronted/product/models/product_model.dart';
import 'package:erp_fronted/src/resources/get_object.dart';

import 'product_list_event.dart';
import 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  ProductListBloc() : super(const ProductListState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<ProductListState> emit) async {
    final url = preDefinedUri('api/products/', {'only': 'model'});
    final Products products = await getObject(url, Products.serializer);

    emit(const ProductListState().productsLoaded(products: products, state: ProductListViewState.loaded));
  }
}
