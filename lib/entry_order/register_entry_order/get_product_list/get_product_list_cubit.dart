import 'package:bloc/bloc.dart';
import 'package:erp_fronted/product/models/product_model.dart';
import 'package:erp_fronted/src/resources/generic_serializer.dart';
import 'package:erp_fronted/src/resources/api_provider.dart';
import 'package:erp_fronted/src/resources/get_object.dart';
import 'package:erp_fronted/src/resources/repository.dart';
import 'package:flutter/material.dart';

import 'get_product_list_state.dart';

class GetProductListCubit extends Cubit<List<DropdownMenuItem<int>>> {

  GetProductListCubit() : super([]);

  void getProduct() async {
    final url = preDefinedUri('api/products', {'only': 'model'});
    Products products = await getObject(url, Products.serializer);

    List<DropdownMenuItem<int>> productItems = [];

    for (var p0 in products.products) {
      productItems.add(DropdownMenuItem<int>(
        child: Text(p0.modelProduct),
        value: p0.id,
      ));
    }

    emit(productItems);
  }
}

class ModelProductDropDownCubit extends Cubit<int> {
  ModelProductDropDownCubit() : super(1);

  void getSelectedModelProduct(int value) {
    return emit(value);
  }
}