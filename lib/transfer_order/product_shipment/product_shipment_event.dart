import 'package:equatable/equatable.dart';

abstract class ProductShipmentEvent extends Equatable {
  const ProductShipmentEvent();
}

class InitEvent extends ProductShipmentEvent {
  @override
  List<Object?> get props => [];

  const InitEvent();
}