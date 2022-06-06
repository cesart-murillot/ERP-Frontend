import 'package:equatable/equatable.dart';

abstract class CheckTransferOrderEvent extends Equatable {
  const CheckTransferOrderEvent();
}

class InitEvent extends CheckTransferOrderEvent {
  final int transferOrderId;
  @override
  List<Object?> get props => [transferOrderId];

  const InitEvent(this.transferOrderId);
}

class ShowSentDialogEvent extends CheckTransferOrderEvent {
  const ShowSentDialogEvent();

  @override
  List<Object> get props => [];
}

class ShowReceivedDialogEvent extends CheckTransferOrderEvent {
  const ShowReceivedDialogEvent();

  @override
  List<Object> get props => [];
}

class MarkAsSentEvent extends CheckTransferOrderEvent {
  const MarkAsSentEvent();

  @override
  List<Object> get props => [];
}

class MarkAsReceivedEvent extends CheckTransferOrderEvent {
  const MarkAsReceivedEvent();

  @override
  List<Object> get props => [];
}

class HideDialogEvent extends CheckTransferOrderEvent {
  const HideDialogEvent();

  @override
  List<Object> get props => [];
}