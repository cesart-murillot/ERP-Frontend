import 'package:bloc/bloc.dart';
import 'package:erp_fronted/product/models/product_model.dart';
import 'package:erp_fronted/src/resources/get_object.dart';

import 'product_request_event.dart';
import 'product_request_state.dart';

class ProductRequestBloc extends Bloc<ProductRequestEvent, ProductRequestState> {
  ProductRequestBloc() : super(const ProductRequestState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<ProductRequestState> emit) async {
    var url = preDefinedUri('api/products/');
    Products products = await getObject(url, Products.serializer);
    print(products);
    emit(state.copyWith(products: products, state: CustomState.loadedState));
  }
}
