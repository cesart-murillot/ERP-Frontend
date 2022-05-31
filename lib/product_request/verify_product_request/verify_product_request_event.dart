import 'package:equatable/equatable.dart';

abstract class VerifyProductRequestEvent extends Equatable {
  const VerifyProductRequestEvent();
}

class InitEvent extends VerifyProductRequestEvent {
  final int transferId;
  const InitEvent(this.transferId);

  @override
  List<Object?> get props => [transferId];
}

class GenerateShipmentOrderEvent extends VerifyProductRequestEvent {
  const GenerateShipmentOrderEvent();
  @override
  List<Object> get props => [];

}