import 'package:equatable/equatable.dart';
import 'package:erp_fronted/product/models/product_model.dart';
import 'package:flutter/material.dart';

enum States { initial, loading, loaded, error }

class GenerateSaleState extends Equatable {
  final States state;
  final String errorMessage;
  final List<Product> products;
  final List<TextEditingController> quantities;
  final List<TextEditingController> prices;
  final List<double> subTotals;
  final double total;

  final String name;
  final String ci;
  GenerateSaleState init() {
    return const GenerateSaleState();
  }

  GenerateSaleState clone({
    required States state,
    List<Product>? products,
    List<TextEditingController>? quantities,
    List<TextEditingController>? prices,
    List<double>? subTotals,
    double? total,
    String? name,
    String? ci,
  }) {
    return GenerateSaleState(
      state: state,
      products: products ?? this.products,
      quantities: quantities ?? this.quantities,
      prices: prices ?? this.prices,
      subTotals: subTotals ?? this.subTotals,
      total: total ?? this.total,
      name: name ?? this.name,
      ci: ci ?? this.ci,
    );
  }

  GenerateSaleState error({required String errorMessage}) {
    return GenerateSaleState(
      state: States.error,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        state,
        errorMessage,
        products,
        quantities,
        prices,
        subTotals,
        total,
        name,
        ci,
      ];

  const GenerateSaleState({
    this.name = '',
    this.ci = '',
    this.quantities = const [],
    this.prices = const [],
    this.subTotals = const [],
    this.total = 0,
    this.products = const [],
    this.state = States.loaded,
    this.errorMessage = '',
  });
}
