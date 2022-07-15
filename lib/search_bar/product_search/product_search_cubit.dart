import 'package:bloc/bloc.dart';
import 'package:erp_fronted/product/models/product_model.dart';
import 'package:erp_fronted/src/resources/get_object.dart';

import 'product_search_state.dart';

class ProductSearchCubit extends Cubit<ProductSearchState> {
  ProductSearchCubit() : super(const ProductSearchState().init());

  Future<void> getMostSaleProducts() async {
    emit(state.searchData(state: States.loading));

    try {
      final Uri url = preDefinedUri('/api/products/', {'only': 'mostSale'});

      final Products products = await getObject(url, Products.serializer);

      emit(state.searchData(state: States.loaded, products: products));
    } catch (e) {
      emit(state.error(errorMessage: e.toString()));
    }
  }

  Future<void> getProducts(String searchQuery) async {
    emit(state.searchData(state: States.loading));

    final Uri url = preDefinedUri('/api/products/', {'search': searchQuery});

    try {
      final Products products = await getObject(url, Products.serializer);

      emit(state.searchData(state: States.loaded, products: products));
    } catch (e) {
      emit(state.error(errorMessage: e.toString()));
    }
  }
}
