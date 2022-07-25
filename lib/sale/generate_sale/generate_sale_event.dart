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