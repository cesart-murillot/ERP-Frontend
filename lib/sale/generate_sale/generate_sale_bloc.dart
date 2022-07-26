import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:erp_fronted/product/models/product_model.dart';
import 'package:erp_fronted/sale/models/sale_model.dart';
import 'package:erp_fronted/src/resources/generic_serializer.dart';
import 'package:erp_fronted/src/resources/get_object.dart';
import 'package:erp_fronted/src/resources/post_object.dart';
import 'package:flutter/cupertino.dart';

import 'generate_sale_event.dart';
import 'generate_sale_state.dart';

class GenerateSaleBloc extends Bloc<GenerateSaleEvent, GenerateSaleState> {
  GenerateSaleBloc() : super(const GenerateSaleState().init()) {
    on<InitEvent>(_init);
    on<AddProductToSaleEvent>(_addProductToSale);
    on<QuantityPriceChangeEvent>(_quantityPriceChange);
    on<NameChangedEvent>(_nameChanged);
    on<CiChangedEvent>(_ciChanged);
    on<SaveSaleEvent>(_saveSale);
  }

  void _init(InitEvent event, Emitter<GenerateSaleState> emit) async {
    emit(state.clone(state: States.loaded));
  }

  FutureOr<void> _addProductToSale(
      AddProductToSaleEvent event, Emitter<GenerateSaleState> emit) async {
    emit(state.clone(state: States.loading));
    final url = preDefinedUri('/api/products/${event.productId}');
    try {
      final Product product = await getObject(url, Product.serializer);

      final List<Product> newProducts = [];
      final List<TextEditingController> newPrices = [];
      final List<TextEditingController> newQuantities = [];
      final List<double> newSubtotals = [];

      newProducts.addAll(state.products);
      newProducts.add(product);

      newPrices.addAll(state.prices);
      newPrices.add(TextEditingController(text: '${product.price}'));

      newQuantities.addAll(state.quantities);
      newQuantities.add(TextEditingController(text: '1'));

      newSubtotals.addAll(state.subTotals);
      newSubtotals.add(product.price);

      var total = 0.0;
      for (var element in newSubtotals) {
        total = total + element;
      }
      final castedTotal = double.parse(total.toStringAsFixed(2));

      emit(state.clone(
        state: States.loaded,
        products: newProducts,
        quantities: newQuantities,
        prices: newPrices,
        subTotals: newSubtotals,
        total: castedTotal,
      ));
    } catch (e) {
      emit(state.error(errorMessage: e.toString()));
    }
  }

  FutureOr<void> _quantityPriceChange(
      QuantityPriceChangeEvent event, Emitter<GenerateSaleState> emit) {
    emit(state.clone(state: States.loading));

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

    emit(state.clone(
      state: States.loaded,
      subTotals: subTotals,
      total: castedTotal,
    ));
  }

  FutureOr<void> _nameChanged(NameChangedEvent event, Emitter<GenerateSaleState> emit) {
    emit(state.clone(state: States.loaded, name: event.name));
  }

  FutureOr<void> _ciChanged(CiChangedEvent event, Emitter<GenerateSaleState> emit) {
    emit(state.clone(state: States.loaded, ci: event.ci));
  }

  FutureOr<void> _saveSale(SaveSaleEvent event, Emitter<GenerateSaleState> emit) async {
    final numberOfProducts = state.products.length;
    if (numberOfProducts > 0) {
      var sale = Sale(
          (s) {
            for (int i = 0; i < numberOfProducts; i++) {
              final quantity = int.parse(state.quantities[i].value.text);
              final unitPrice = double.parse(state.prices[i].value.text);
              final productId = state.products[i].id;
              final totalPrice = unitPrice * quantity;
              var productSale = ProductSale(
                  (ps) {
                    ps.quantity = quantity;
                    ps.unitPrice = unitPrice;
                    ps.totalPrice = totalPrice;
                    ps.productId = productId;
                  }
              );

              s.productSales.add(productSale);
              s.totalSale = state.total;
              s.nameSale = state.name;
              s.nitSale = state.ci;
            }
          }
      );

      final url = preDefinedUri('/api/sales/');
      final saleString = objectToString(sale, Sale.serializer);
      if (saleString != null) {
        final response = await postDataToApi(url, saleString);
        final decode = jsonDecode(response);
        print(decode);
      }
    }
  }
}
