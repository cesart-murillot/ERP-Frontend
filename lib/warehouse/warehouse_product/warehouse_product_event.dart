import 'package:equatable/equatable.dart';

abstract class WarehouseProductEvent extends Equatable {
  const WarehouseProductEvent();
}

class InitEvent extends WarehouseProductEvent {
  final int warehouseId;
  @override
  List<Object?> get props => [warehouseId];

  const InitEvent(this.warehouseId);
}