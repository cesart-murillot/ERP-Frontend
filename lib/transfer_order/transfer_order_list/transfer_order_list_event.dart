import 'package:equatable/equatable.dart';

abstract class TransferOrderListEvent extends Equatable {
  const TransferOrderListEvent();
}

class InitEvent extends TransferOrderListEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}