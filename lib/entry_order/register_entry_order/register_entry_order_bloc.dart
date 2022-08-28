import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:erp_fronted/entry_order/models/entry_order_model.dart';
import 'package:erp_fronted/entry_order/models/entry_order_product_model.dart';
import 'package:erp_fronted/src/resources/generic_serializer.dart';
import 'package:erp_fronted/src/resources/get_object.dart';
import 'package:erp_fronted/src/resources/post_object.dart';

import 'register_entry_order_event.dart';
import 'register_entry_order_state.dart';

class RegisterEntryOrderBloc extends Bloc<RegisterEntryOrderEvent, RegisterEntryOrderState> {
  final List<int> products = [];
  final List<int> quantity = [];
  final List<String> code = [];

  RegisterEntryOrderBloc() : super(const RegisterEntryOrderState().init()) {
    on<InitEvent>(_init);
    on<StoreCodeEvent>(_storeCode);
    on<StoreProduct>(_storeProduct);
    on<StoreQuantity>(_storeQuantity);
    on<ClearMapList>(_clearMapList);
    on<SaveData>(_saveData);
    on<StoreProductQuantityEvent>(_storeProductQuantityEvent);
  }

  FutureOr<void> _init(InitEvent event, Emitter<RegisterEntryOrderState> emit) {
  }

  FutureOr<void> _storeCode(StoreCodeEvent event, Emitter<RegisterEntryOrderState> emit) {
    emit(state.clone(entryOrder: event.code));
  }

  FutureOr<void> _storeProduct(StoreProduct event, Emitter<RegisterEntryOrderState> emit) {
    products.add(event.product);
  }

  FutureOr<void> _storeQuantity(StoreQuantity event, Emitter<RegisterEntryOrderState> emit) {
    quantity.add(event.quantity);
  }

  FutureOr<void> _clearMapList(ClearMapList event, Emitter<RegisterEntryOrderState> emit) {
    final List<Map<String, int>> productQuantity = [];
    emit(state.clone(productQuantity: productQuantity));
  }

  Future<FutureOr<void>> _saveData(SaveData event, Emitter<RegisterEntryOrderState> emit) async {
    final productQuantityList = state.productQuantity;
    final entryCode = state.entryOrder;

    var entryOrder = EntryOrder((entryOrder) {
        for (int i = 0; i < productQuantityList.length; i++) {
          var entryOrderProduct = EntryOrderProduct(((p0) {
            final productQuantity = productQuantityList[i];
            p0.productId = productQuantity['productId'];
            p0.quantity = productQuantity['quantity'];
          }));
          entryOrder.entryOrderProduct.add(entryOrderProduct);
        }
        entryOrder.codeEntryOrder = entryCode;
      },
    );

    final entryOrderString = objectToString(entryOrder, EntryOrder.serializer);
    final url = preDefinedUri('api/entryorders');

    try {
      final String response = await postDataToApi(url, entryOrderString);
    } catch (e) {
      print('error');
      emit(state.error(errorMessage: e.toString()));
    }
  }

  FutureOr<void> _storeProductQuantityEvent(StoreProductQuantityEvent event, Emitter<RegisterEntryOrderState> emit) {
    final List<Map<String, int>> productQuantity = [];
    productQuantity.addAll(state.productQuantity);
    productQuantity.add(event.productQuantity);
    emit(state.clone(productQuantity: productQuantity));
  }
}
