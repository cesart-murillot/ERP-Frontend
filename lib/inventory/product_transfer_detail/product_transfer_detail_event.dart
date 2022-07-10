import 'package:equatable/equatable.dart';

abstract class ProductTransferDetailEvent extends Equatable {
  const ProductTransferDetailEvent();
}

class InitEvent extends ProductTransferDetailEvent {
  final int transferId;
  @override
  List<Object?> get props => [transferId];

  const InitEvent(this.transferId);
}

class GenerateShipmentOrderEvent extends ProductTransferDetailEvent {
  const GenerateShipmentOrderEvent();
  @override
  List<Object> get props => [];
}

class DismissModalEvent extends ProductTransferDetailEvent {
  const DismissModalEvent();
  @override
  List<Object> get props => [];
}