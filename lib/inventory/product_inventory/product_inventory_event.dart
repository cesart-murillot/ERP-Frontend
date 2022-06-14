import 'package:equatable/equatable.dart';

abstract class ProductInventoryEvent extends Equatable {
  const ProductInventoryEvent();
}

class InitEvent extends ProductInventoryEvent {
  @override
  List<Object?> get props => [];
}