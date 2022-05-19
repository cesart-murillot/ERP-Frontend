import 'dart:async';

import 'package:bloc/bloc.dart';

import 'register_entry_order_event.dart';
import 'register_entry_order_state.dart';

class RegisterEntryOrderBloc extends Bloc<RegisterEntryOrderEvent, RegisterEntryOrderState> {
  final List<Map<String, dynamic>> products = [];
  final List<Map<String, dynamic>> quantity = [];
  RegisterEntryOrderBloc() : super(const InitState()) {
    on<InitEvent>(_init);
    on<StoreCodeEvent>(_storeCode);
    on<StoreProduct>(_storeProduct);
    on<StoreQuantity>(_storeQuantity);
  }

  FutureOr<void> _init(InitEvent event, Emitter<RegisterEntryOrderState> emit) {
    print('hello workd');
  }

  FutureOr<void> _storeCode(StoreCodeEvent event, Emitter<RegisterEntryOrderState> emit) {

  }

  FutureOr<void> _storeProduct(StoreProduct event, Emitter<RegisterEntryOrderState> emit) {
    products.add(event.product);
    print(products);
  }

  FutureOr<void> _storeQuantity(StoreQuantity event, Emitter<RegisterEntryOrderState> emit) {
    quantity.add(event.quantity);
    print(quantity);
  }
}
