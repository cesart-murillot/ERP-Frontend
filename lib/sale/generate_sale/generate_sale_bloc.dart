import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:erp_fronted/product/models/product_model.dart';
import 'package:erp_fronted/src/resources/get_object.dart';

import 'generate_sale_event.dart';
import 'generate_sale_state.dart';

class GenerateSaleBloc extends Bloc<GenerateSaleEvent, GenerateSaleState> {
  GenerateSaleBloc() : super(const GenerateSaleState().init()) {
    on<InitEvent>(_init);
    on<AddProductToSaleEvent>(_addProductToSale);
  }

  void _init(InitEvent event, Emitter<GenerateSaleState> emit) async {
    emit(state.clone(state: States.loaded));
  }

  FutureOr<void> _addProductToSale(AddProductToSaleEvent event, Emitter<GenerateSaleState> emit) async {
    emit(state.clone(state: States.loading));
    final url = preDefinedUri('/api/products/${event.productId}');
    try {
      final Product product = await getObject(url, Product.serializer);

      final stateProducts = state.products;
      final List<Product> newProducts = [];

      newProducts.addAll(stateProducts);
      newProducts.add(product);

      emit(state.clone(state: States.loaded, products: newProducts));
    } catch (e) {
      emit(state.error(errorMessage: e.toString()));
    }
  }
}
