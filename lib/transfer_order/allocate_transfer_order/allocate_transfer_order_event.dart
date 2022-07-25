import 'package:equatable/equatable.dart';

abstract class AllocateTransferOrderEvent extends Equatable {
  const AllocateTransferOrderEvent();
}

class InitEvent extends AllocateTransferOrderEvent {
  final int transferProductId;
  @override
  List<Object?> get props => [transferProductId];

  const InitEvent(this.transferProductId);
}

class AddWarehouseEvent extends AllocateTransferOrderEvent {
  final int warehouseId;

  @override
  List<Object?> get props => [warehouseId];

  const AddWarehouseEvent(this.warehouseId);
}

class AddSectionEvent extends AllocateTransferOrderEvent {
  final int sectionId;
  final int index;

  @override
  List<Object?> get props => [sectionId];

  const AddSectionEvent(this.sectionId, this.index,);
}

class AllocateProductEvent extends AllocateTransferOrderEvent {

  @override
  List<Object?> get props => [];

  const AllocateProductEvent();
}