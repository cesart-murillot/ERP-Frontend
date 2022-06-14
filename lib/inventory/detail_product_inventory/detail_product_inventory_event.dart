import 'package:equatable/equatable.dart';

abstract class DetailProductInventoryEvent extends Equatable {}

class InitEvent extends DetailProductInventoryEvent {
  final int productId;
  @override
  List<Object?> get props => [productId];

  InitEvent(this.productId);
}