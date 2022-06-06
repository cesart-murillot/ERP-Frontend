import 'package:equatable/equatable.dart';

abstract class CheckEntryOrderEvent extends Equatable {
  const CheckEntryOrderEvent();
}

class InitEvent extends CheckEntryOrderEvent {
  final int entryOrderId;

  @override
  List<Object?> get props => [entryOrderId];

  const InitEvent(this.entryOrderId);
}

class MarkAsCheckedEvent extends CheckEntryOrderEvent {
  final int index;
  final bool value;
  const MarkAsCheckedEvent(this.index, this.value);

  @override
  List<Object> get props => [index, value];
}

class VerifyEvent extends CheckEntryOrderEvent {
  const VerifyEvent();

  @override
  List<Object> get props => [];
}