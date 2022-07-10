import 'package:equatable/equatable.dart';

abstract class ProductTransferEvent extends Equatable {
  const ProductTransferEvent();
}

class InitEvent extends ProductTransferEvent {
  @override
  List<Object?> get props => [];

  const InitEvent();
}