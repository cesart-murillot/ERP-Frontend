import 'package:bloc/bloc.dart';
import 'package:erp_fronted/product/models/product_model.dart';
import 'package:erp_fronted/src/resources/get_object.dart';

import 'product_detail_event.dart';
import 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc() : super(const ProductDetailState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<ProductDetailState> emit) async {
    emit(state.productData(state: ProductDetailViewState.loading));

    final url = preDefinedUri('/api/products/${event.productId}');
    final Product product = await getObject(url, Product.serializer);

    emit(state.productData(state: ProductDetailViewState.loaded, product: product));
  }
}
