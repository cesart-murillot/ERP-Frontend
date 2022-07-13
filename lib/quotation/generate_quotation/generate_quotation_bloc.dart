import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:erp_fronted/quotation/models/quotation_model.dart';

import 'generate_quotation_event.dart';
import 'generate_quotation_state.dart';

class GenerateQuotationBloc extends Bloc<GenerateQuotationEvent, GenerateQuotationState> {
  GenerateQuotationBloc() : super(const GenerateQuotationState().init()) {
    on<InitEvent>(_init);
    on<AddProductQuotationEvent>(_addProductQuotation);
  }

  void _init(InitEvent event, Emitter<GenerateQuotationState> emit) async {
    emit(state.clone());
  }

  FutureOr<void> _addProductQuotation(AddProductQuotationEvent event, Emitter<GenerateQuotationState> emit) {
    var productQuotation = ProductQuotation((b) => b
      ..id = 1
      ..quantity = 10
      ..unitPrice = 20
      ..totalPrice = 200
      ..quotationId = 1
      ..productId = 1);

    final List<int> list = [];

    list.addAll(state.list);
    list.add(1);

    emit(state.addedProductQuotation(numberOfElements: state.numberOfElements + 1, list: list));
  }
}
