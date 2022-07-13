import 'package:built_collection/built_collection.dart';
import 'package:equatable/equatable.dart';
import 'package:erp_fronted/quotation/models/quotation_model.dart';

enum States { loading, loaded }

class GenerateQuotationState extends Equatable {
  //final products = <ProductQuotation>[];
  final ListBuilder<ProductQuotation>? products;
  final States? state;
  final int numberOfElements;
  final List<int> list;

  GenerateQuotationState init() {
    return const GenerateQuotationState();
  }

  GenerateQuotationState clone() {
    return const GenerateQuotationState();
  }

  GenerateQuotationState addedProductQuotation({
    required int numberOfElements,
    List<int>? list,
  }) {
    return GenerateQuotationState(
      numberOfElements: numberOfElements,
      list: list ?? this.list,
    );
  }

  @override
  List<Object?> get props => [products, state, numberOfElements, list];

  const GenerateQuotationState({
    this.products,
    this.state,
    this.numberOfElements = 0,
    this.list = const [],
  });
}
