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
  final String code;
}

class StoreQuantity extends RegisterEntryOrderEvent {
  final int quantity;
  const StoreQuantity(this.quantity);

  @override
  List<Object> get props => [quantity];
}

class StoreProduct extends RegisterEntryOrderEvent {
  final int product;

  @override
  List<Object> get props => [product];

  const StoreProduct(this.product);
}

class ClearMapList extends RegisterEntryOrderEvent {
  const ClearMapList();
  @override
  List<Object?> get props => [];
}

class SaveData extends RegisterEntryOrderEvent {

  const SaveData();

  @override
  List<Object?> get props => [];
}