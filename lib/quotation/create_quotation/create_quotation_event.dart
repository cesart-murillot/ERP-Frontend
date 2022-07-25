import 'package:equatable/equatable.dart';

abstract class CreateQuotationEvent extends Equatable {
  const CreateQuotationEvent();
}

class InitEvent extends CreateQuotationEvent {

  @override
  List<Object?> get props => [];

  const InitEvent();
}

class AddProductQuotationEvent extends CreateQuotationEvent {
  final int productId;
  @override
  List<Object?> get props => [productId];

  const AddProductQuotationEvent(this.productId);
}