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