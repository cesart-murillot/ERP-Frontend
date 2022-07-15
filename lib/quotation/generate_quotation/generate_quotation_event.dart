import 'package:equatable/equatable.dart';

abstract class GenerateQuotationEvent extends Equatable {
  const GenerateQuotationEvent();
}

class InitEvent extends GenerateQuotationEvent {
  @override
  List<Object?> get props => [];
}

class AddProductQuotationEvent extends GenerateQuotationEvent {
  final int productId;
  @override
  List<Object?> get props => [productId];

  const AddProductQuotationEvent(this.productId);
}

class RemoveProductQuotationEvent extends GenerateQuotationEvent {
  final int index;
  @override
  List<Object?> get props => [index];

  const RemoveProductQuotationEvent(this.index);
}

class QuantityPriceChangeEvent extends GenerateQuotationEvent {
  //final double price;
  final int index;

  @override
  List<Object?> get props => [index];

  const QuantityPriceChangeEvent(this.index);
}