import 'package:bloc/bloc.dart';
import 'package:erp_fronted/product/models/product_model.dart';
import 'package:erp_fronted/src/resources/get_object.dart';
import 'package:flutter/material.dart';

import 'product_dropdown_state.dart';

class ProductDropdownCubit extends Cubit<ProductDropdownState> {
  ProductDropdownCubit() : super(const ProductDropdownState().init());

  void populateProductDropdown() async {
    final url = preDefinedUri('api/products', {'only': 'model'});
    Products products = await getObject(url, Products.serializer);

    List<DropdownMenuItem<int>> productItems = [];

    for (var p0 in products.products) {
      productItems.add(DropdownMenuItem<int>(
        child: Text(p0.modelProduct),
        value: p0.id,
      ));
    }

    emit(const ProductDropdownState().itemsLoaded(productItems: productItems));
  }
}
