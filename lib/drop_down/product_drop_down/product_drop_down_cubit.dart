import 'package:bloc/bloc.dart';
import 'package:erp_fronted/product/models/product_model.dart';
import 'package:erp_fronted/src/resources/get_object.dart';

import 'product_drop_down_state.dart';

class ProductDropDownCubit extends Cubit<ProductDropDownState> {
  ProductDropDownCubit() : super(const ProductDropDownState().init());

  Future<void> getProducts() async {
    emit(state.clone(state: States.loading));

    final Uri url = preDefinedUri('/api/products/');

    try {
      final Products products = await getObject(url, Products.serializer);

      emit(state.clone(state: States.loaded, products: products));
    } catch (e) {
      emit(state.error(errorMessage: e.toString()));
    }
  }
}
