import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:erp_fronted/product/models/product_model.dart';
import 'package:erp_fronted/src/resources/get_object.dart';
import 'package:http/http.dart';

import 'product_inventory_event.dart';
import 'product_inventory_state.dart';

class ProductInventoryBloc extends Bloc<ProductInventoryEvent, ProductInventoryState> {
  ProductInventoryBloc() : super(const ProductInventoryState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<ProductInventoryState> emit) async {
    emit(state.loadedData(state: States.loading));
    final url = preDefinedUri('api/entries/');
    try {
      final data = await get(url);
      final jsonString = jsonDecode(data.body);
      final List<Product> products = [];

      for (var element in jsonString) {
        final urlProduct = preDefinedUri('api/products/${element['product_id']}', {'only': 'basicInfo'});
        final Product product = await getObject(urlProduct, Product.serializer);
        products.add(product);
      }
/*      jsonString.forEach((element) async {
            final urlProduct = preDefinedUri('api/products/${element['product_id']}', {'only': 'basicInfo'});
            final Product product = await getObject(urlProduct, Product.serializer);
            products.add(product);
          });*/

      emit(state.loadedData(state: States.loaded, products: products, quantities: jsonString));
    } catch (e) {
      print(e);
    }

  }
}
