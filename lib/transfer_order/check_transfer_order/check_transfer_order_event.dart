import 'package:equatable/equatable.dart';

abstract class CheckTransferOrderEvent extends Equatable {
  const CheckTransferOrderEvent();
}

class InitEvent extends CheckTransferOrderEvent {
  final int transferOrderId;
  @override
  List<Object?> get props => throw UnimplementedError();

  const InitEvent(this.transferOrderId);
}