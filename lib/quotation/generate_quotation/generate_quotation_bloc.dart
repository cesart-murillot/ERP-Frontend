import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:erp_fronted/product/models/product_model.dart';
import 'package:erp_fronted/quotation/models/quotation_model.dart';
import 'package:erp_fronted/src/resources/generic_serializer.dart';
import 'package:erp_fronted/src/resources/get_object.dart';
import 'package:erp_fronted/src/resources/post_object.dart';
import 'package:flutter/material.dart';

import 'generate_quotation_event.dart';
import 'generate_quotation_state.dart';

class GenerateQuotationBloc
    extends Bloc<GenerateQuotationEvent, GenerateQuotationState> {
  GenerateQuotationBloc() : super(const GenerateQuotationState().init()) {
    on<InitEvent>(_init);
    on<AddProductQuotationEvent>(_addProductQuotation);
    on<QuantityPriceChangeEvent>(_quantityPriceChange);
    on<RemoveProductQuotationEvent>(_removeProductQuotation);
    on<SaveQuotationEvent>(_saveQuotation);
    on<NameQuotationChangedEvent>(_nameQuotationChanged);
  }

  void _init(InitEvent event, Emitter<GenerateQuotationState> emit) async {
    /*final List<TextEditingController> controller = [];
    final textEditingController = TextEditingController(text: '');
    controller.add(textEditingController);
    emit(state.clone(controller: controller));*/
  }

  Future<FutureOr<void>> _addProductQuotation(AddProductQuotationEvent event,
      Emitter<GenerateQuotationState> emit) async {
    final List<Product> products = [];
    final List<TextEditingController> quantities = [];
    final List<TextEditingController> prices = [];
    final List<double> subTotals = [];

    products.addAll(state.products);
    quantities.addAll(state.quantities);
    prices.addAll(state.prices);
    subTotals.addAll(state.subTotals);

    try {
      final url = preDefinedUri('/api/products/${event.productId}');
      final Product product = await getObject(url, Product.serializer);
      products.add(product);

      final TextEditingController price =
          TextEditingController(text: '${product.price}');
      final TextEditingController quantity =
          TextEditingController(text: '${1}');
      final double subTotal = product.price * 1;

      prices.add(price);
      quantities.add(quantity);
      subTotals.add(subTotal);

      var total = 0.0;
      for (var element in subTotals) {
        total = total + element;
      }
      final castedTotal = double.parse(total.toStringAsFixed(2));

      emit(state.addedProductQuotation(
        total: castedTotal,
        state: States.loading,
        products: products,
        prices: prices,
        quantities: quantities,
        subTotals: subTotals,
      ));
    } catch (e) {
      print(e);
    }
  }

  FutureOr<void> _quantityPriceChange(
      QuantityPriceChangeEvent event, Emitter<GenerateQuotationState> emit) {
    emit(state.addedProductQuotation(state: States.loading));
    final subTotals = state.subTotals;
    var price = 0.0;
    var quantity = 0;

    if (state.prices[event.index].value.text.isEmpty) {
      price = 0;
    } else {
      price = double.parse(state.prices[event.index].value.text);
    }

    if (state.quantities[event.index].value.text.isEmpty) {
      quantity = 0;
    } else {
      quantity = int.parse(state.quantities[event.index].value.text);
    }

    final double subTotal = price * quantity;

    final castedSubTotal = double.parse(subTotal.toStringAsFixed(2));
    subTotals[event.index] = castedSubTotal;

    var total = 0.0;
    for (var element in subTotals) {
      total = total + element;
    }

    final castedTotal = double.parse(total.toStringAsFixed(2));

    emit(state.addedProductQuotation(
        state: States.loaded, subTotals: subTotals, total: castedTotal));
  }

  FutureOr<void> _removeProductQuotation(
      RemoveProductQuotationEvent event, Emitter<GenerateQuotationState> emit) {
    emit(state.addedProductQuotation(state: States.loading));

    final products = state.products;
    final quantities = state.quantities;
    final prices = state.prices;
    final subTotals = state.subTotals;

    products.removeAt(event.index);
    quantities.removeAt(event.index);
    prices.removeAt(event.index);
    subTotals.removeAt(event.index);

    var total = 0.0;
    for (var element in subTotals) {
      total = total + element;
    }

    final castedTotal = double.parse(total.toStringAsFixed(2));
    emit(state.addedProductQuotation(
      state: States.loaded,
      subTotals: subTotals,
      total: castedTotal,
      prices: prices,
      products: products,
      quantities: quantities,
    ));
  }

  FutureOr<void> _saveQuotation(
      SaveQuotationEvent event, Emitter<GenerateQuotationState> emit) async {
    final numberOfProducts = state.products.length;
    if (numberOfProducts > 0) {
      var quotation = Quotation(
        (p0) {
          for (int i = 0; i < numberOfProducts; i++) {
            final quantity = int.parse(state.quantities[i].value.text);
            final unitPrice = double.parse(state.prices[i].value.text);
            final productId = state.products[i].id;
            final totalPrice = unitPrice * quantity;
            var productQuotation = ProductQuotation((pq) => pq
              ..quantity = quantity
              ..unitPrice = unitPrice
              ..totalPrice = totalPrice
              ..productId = productId);
            p0.productQuotations.add(productQuotation);
            p0.priceQuotation = state.total;
            p0.nameQuotation = 'TODO';
          }
        },
      );

      final url = preDefinedUri('/api/quotations/');
      final quotationString = objectToString(quotation, Quotation.serializer);
      if (quotationString != null) {
        try {
          emit(state.addedProductQuotation(state: States.loading));
          final response = await postDataToApi(url, quotationString);

          final decode = jsonDecode(response);
          final id = decode['id'];
          if (id is int) {
            emit(state.addedProductQuotation(state: States.loaded, quotationId: id));
          }
        } catch (e) {
          //print(e);
        }
      }
    }
  }

  FutureOr<void> _nameQuotationChanged(NameQuotationChangedEvent event, Emitter<GenerateQuotationState> emit) {
    emit(state.addedProductQuotation(state: States.loading));
    emit(state.addedProductQuotation(state: States.loaded, nameQuotation: event.nameQuotation));
  }
}
