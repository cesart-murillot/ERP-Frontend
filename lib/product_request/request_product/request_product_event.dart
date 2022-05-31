import 'package:equatable/equatable.dart';

abstract class RequestProductEvent extends Equatable {
  const RequestProductEvent();
}

class InitEvent extends RequestProductEvent {
  @override
  List<Object?> get props => [];
}

class StoreDataEvent extends RequestProductEvent {

  const StoreDataEvent();
  @override
  List<Object> get props => [];
}

class AddProductEvent extends RequestProductEvent {
  const AddProductEvent(this.productId);
  final int productId;
  @override
  List<Object> get props => [productId];
}

class AddQuantityEvent extends RequestProductEvent {
  final int quantity;

  @override
  List<Object?> get props => [quantity];

  const AddQuantityEvent(this.quantity);
}

class SaveDataEvent extends RequestProductEvent {

  @override
  List<Object?> get props => [];

  const SaveDataEvent();
}

class ClearDataEvent extends RequestProductEvent {

  @override
  List<Object?> get props => [];

  const ClearDataEvent();
}