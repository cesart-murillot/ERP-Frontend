import 'package:equatable/equatable.dart';

abstract class ShowSaleEvent extends Equatable {}

class InitEvent extends ShowSaleEvent {
  final int saleId;
  @override
  List<Object?> get props => [saleId];

  InitEvent(this.saleId);
}