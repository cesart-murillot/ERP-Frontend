import 'package:equatable/equatable.dart';
import 'package:erp_fronted/product/models/product_model.dart';
import 'package:flutter/material.dart';

enum States { loading, loaded }

class GenerateQuotationState extends Equatable {
  final States? state;
  final List<Product> products;

  final List<TextEditingController> quantities;
  final List<TextEditingController> prices;
  final List<double> subTotals;

  final double total;
  final String nameQuotation;

  final int quotationId;

  GenerateQuotationState init() {
    return const GenerateQuotationState();
  }

  GenerateQuotationState clone() {
    return const GenerateQuotationState();
  }

  GenerateQuotationState addedProductQuotation({
    required States state,
    List<Product>? products,
    List<TextEditingController>? quantities,
    List<TextEditingController>? prices,
    List<double>? subTotals,
    double? total,
    String? nameQuotation,
    int? quotationId,
  }) {
    return GenerateQuotationState(
      state: state,
      products: products ?? this.products,
      quantities: quantities ?? this.quantities,
      prices: prices ?? this.prices,
      subTotals: subTotals ?? this.subTotals,
      total: total ?? this.total,
      nameQuotation: nameQuotation ?? this.nameQuotation,
      quotationId: quotationId ?? this.quotationId,
    );
  }

  @override
  List<Object?> get props => [
        state,
        products,
        quantities,
        prices,
        subTotals,
        total,
        nameQuotation,
        quotationId,
      ];

  const GenerateQuotationState({
    this.quantities = const [],
    this.prices = const [],
    this.subTotals = const [],
    this.total = 0,
    this.state,
    this.products = const [],
    this.nameQuotation = '',
    this.quotationId = 0,
  });
}
