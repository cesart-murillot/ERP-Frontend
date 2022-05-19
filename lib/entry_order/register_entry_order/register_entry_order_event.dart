import 'package:equatable/equatable.dart';

abstract class RegisterEntryOrderEvent extends Equatable {

  const RegisterEntryOrderEvent();
}

class InitEvent extends RegisterEntryOrderEvent {
  @override
  List<Object?> get props => [];

  const InitEvent();
}

class StoreCodeEvent extends RegisterEntryOrderEvent {
  @override
  List<Object> get props => [code];
  const StoreCodeEvent(this.code);
  final Map<String, dynamic> code;
}

class StoreQuantity extends RegisterEntryOrderEvent {
  final Map<String, dynamic> quantity;
  const StoreQuantity(this.quantity);

  @override
  List<Object> get props => [quantity];
}

class StoreProduct extends RegisterEntryOrderEvent {
  final Map<String, dynamic> product;

  @override
  List<Object> get props => [product];

  const StoreProduct(this.product);
}