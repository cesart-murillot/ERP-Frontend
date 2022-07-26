import 'package:equatable/equatable.dart';

abstract class GenerateSaleEvent extends Equatable {
  const GenerateSaleEvent();
}

class InitEvent extends GenerateSaleEvent {
  @override
  List<Object?> get props => [];

  const InitEvent();
}

class AddProductToSaleEvent extends GenerateSaleEvent {
  final int productId;
  @override
  List<Object?> get props => [productId];

  const AddProductToSaleEvent(this.productId);
}

class QuantityPriceChangeEvent extends GenerateSaleEvent {
  final int index;

  @override
  List<Object?> get props => [index];

  const QuantityPriceChangeEvent(this.index);
}

class NameChangedEvent extends GenerateSaleEvent {
  final String name;
  @override
  List<Object?> get props => [];

  const NameChangedEvent(this.name);
}

class CiChangedEvent extends GenerateSaleEvent {
  final String ci;
  @override
  List<Object?> get props => [];

  const CiChangedEvent(this.ci);
}

class SaveSaleEvent extends GenerateSaleEvent {
  @override
  List<Object?> get props => [];

  const SaveSaleEvent();
}