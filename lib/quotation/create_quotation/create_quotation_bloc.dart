import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:erp_fronted/product/models/product_model.dart';
import 'package:erp_fronted/src/resources/get_object.dart';

import 'create_quotation_event.dart';
import 'create_quotation_state.dart';

class CreateQuotationBloc
    extends Bloc<CreateQuotationEvent, CreateQuotationState> {
  CreateQuotationBloc() : super(const CreateQuotationState().init()) {
    on<InitEvent>(_init);
    on<AddProductQuotationEvent>(_addProductQuotation);
  }

  void _init(InitEvent event, Emitter<CreateQuotationState> emit) async {
    //emit(state.clone());
  }

  Future<FutureOr<void>> _addProductQuotation(AddProductQuotationEvent event,
      Emitter<CreateQuotationState> emit) async {
    emit(state.clone(state: States.loading));

    final List<Map<String, dynamic>> quotationData = state.quotationData;

    final List<Map<String, dynamic>> newQuotationData = [];
    newQuotationData.addAll(quotationData);

    try {
      final url = preDefinedUri('/api/products/${event.productId}');
      final Product product = await getObject(url, Product.serializer);

      Map<String, dynamic> productData = {
        'productId': product.id,
        'productName': '${product.modelProduct} - ${product.formatProduct}',
        'price': product.price,
        'quantity': 1,
        'subTotal': product.price * 1,
      };
      newQuotationData.add(productData);
      emit(state.clone(state: States.loaded, quotationData: newQuotationData));
    } catch (e) {
      print(e);
    }
  }
}
