import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:erp_fronted/product/models/product_model.dart';
import 'package:erp_fronted/src/resources/generic_serializer.dart';
import 'package:flutter/material.dart';

class ModelProductDropDownCubit extends Cubit<List<DropdownMenuItem<String>>> {
  ModelProductDropDownCubit() : super([]);

  void fetchModelProduct() {
    print('se llamo al bloc');
    emit([
      const DropdownMenuItem<String>(child: Text('Item 1'), value: 'Item 1',),
      const DropdownMenuItem<String>(child: Text('Item 2'), value: 'Item 2',),
      const DropdownMenuItem<String>(child: Text('Item 3'), value: 'Item 3',),
      const DropdownMenuItem<String>(child: Text('Item 4'), value: 'Item 4',),
      const DropdownMenuItem<String>(child: Text('Item 5'), value: 'Item 5',)
    ]);
  }
}
class ModelProductDropDownSelectCubit extends Cubit<String> {
  ModelProductDropDownSelectCubit() : super('Item 1');

  void selectModelProduct(String value) {
    print(value);
    return emit(value);
  }
}

class ProductCreateSaveData extends Cubit<String> {
  ProductCreateSaveData() : super('');
  final Map<String, dynamic> product = {};
  void saveData(Map<String, dynamic> value) {
    product.addAll(value);
  }
  void printData() {
    Product productObject = parseObject(jsonEncode(product), Product.serializer);
    print(productObject);

    print(objectToString(productObject, Product.serializer));
  }
}

class ProductCreateShowAdditionalInformation extends Cubit<bool> {
  ProductCreateShowAdditionalInformation() : super(false);
  void showAdditionalInformation() => emit(true);
  void hideAdditionalInformation() => emit(false);
}

class ProductCreateShowTechnicalInformation extends Cubit<bool> {
  ProductCreateShowTechnicalInformation() : super(false);

  void showTechnicalInformation() => emit(true);
  void hideTechnicalInformation() => emit(false);
}
