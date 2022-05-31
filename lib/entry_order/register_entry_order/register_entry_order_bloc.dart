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

  RegisterEntryOrderBloc() : super(const InitState()) {
    on<InitEvent>(_init);
    on<StoreCodeEvent>(_storeCode);
    on<StoreProduct>(_storeProduct);
    on<StoreQuantity>(_storeQuantity);
    on<ClearMapList>(_clearMapList);
    on<SaveData>(_saveData);
  }

  FutureOr<void> _init(InitEvent event, Emitter<RegisterEntryOrderState> emit) {
  }

  FutureOr<void> _storeCode(StoreCodeEvent event, Emitter<RegisterEntryOrderState> emit) {
    code.add(event.code);
  }

  FutureOr<void> _storeProduct(StoreProduct event, Emitter<RegisterEntryOrderState> emit) {
    products.add(event.product);
  }

  FutureOr<void> _storeQuantity(StoreQuantity event, Emitter<RegisterEntryOrderState> emit) {
    quantity.add(event.quantity);
  }

  FutureOr<void> _clearMapList(ClearMapList event, Emitter<RegisterEntryOrderState> emit) {
    products.clear();
    quantity.clear();
    code.clear();
  }

  Future<FutureOr<void>> _saveData(SaveData event, Emitter<RegisterEntryOrderState> emit) async {

    var entryOrder = EntryOrder((entryOrder) {
        for (int i = 0; i < products.length; i++) {
          var entryOrderProduct = EntryOrderProduct(((p0) {
            p0.productId = products[i];
            p0.quantity = quantity[i];
          }));
          entryOrder.entryOrderProduct.add(entryOrderProduct);
        }
        entryOrder.codeEntryOrder = code.first;
      },
    );

    final entryOrderString = objectToString(entryOrder, EntryOrder.serializer);
    final url = preDefinedUri('api/entryorders');

    try {
      final String response = await postDataToApi(url, entryOrderString!);
      print(response);
    } catch (e) {
      print(e);
    }
  }
}
