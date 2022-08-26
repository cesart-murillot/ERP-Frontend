import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:erp_fronted/product/models/product_model.dart';
import 'package:erp_fronted/src/resources/generic_serializer.dart';
import 'package:erp_fronted/src/resources/get_object.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'product_add_event.dart';
import 'product_add_state.dart';

class ProductAddBloc extends Bloc<ProductAddEvent, ProductAddState> {
  ProductAddBloc() : super(const ProductAddState().init()) {
    on<InitEvent>(_init);
    on<ShowAddInfoEvent>(_showAddInfo);
    on<UploadImageEvent>(_uploadImage);
    on<StoreFormatEvent>(_storeFormat);
    on<StoreModelEvent>(_storeEvent);
    on<SaveDataEvent>(_saveData);
  }

  void _init(InitEvent event, Emitter<ProductAddState> emit) async {
    emit(state.clone());
  }

  FutureOr<void> _showAddInfo(ShowAddInfoEvent event, Emitter<ProductAddState> emit) {
    emit(state.addAddInfo(addInfo: event.showAddInfo, techInfo: event.showTechInfo));
  }


  FutureOr<void> _uploadImage(UploadImageEvent event, Emitter<ProductAddState> emit) {
    emit(state.clone(image: event.image));
  }

  FutureOr<void> _storeFormat(StoreFormatEvent event, Emitter<ProductAddState> emit) {
    emit(state.clone(format: event.format));
  }

  FutureOr<void> _storeEvent(StoreModelEvent event, Emitter<ProductAddState> emit) {
    emit(state.clone(model: event.model));
  }

  FutureOr<void> _saveData(SaveDataEvent event, Emitter<ProductAddState> emit) async {
    var product = Product(
      (p0) {
        p0.modelProduct = state.model;
        p0.formatProduct = state.format;
        p0.price = 0;
      },
    );

    final productString = objectToString(product, Product.serializer);

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.get('token');

    final uri = preDefinedUri('/api/products/');

    var request = http.MultipartRequest('POST', uri)
    ..fields['product'] = productString
    ..files.add(http.MultipartFile.fromBytes('image_product', await state.image!.readAsBytes(), filename: 'image_product'))
    ..headers['Content-Type'] = 'application/json'
    ..headers['enctype'] = 'multipart/form-data'
    ..headers['Accept'] = 'application/json'
    ..headers['Authorization'] = 'Bearer $token';

    var response = await request.send();
    final respStr = await response.stream.bytesToString();

    print(respStr);
    print(request.files.first.length);
  }
}
