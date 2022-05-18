import 'package:equatable/equatable.dart';
import 'package:erp_fronted/entry_order/models/entry_order_model.dart';

abstract class VerifyEntryOrderState extends Equatable {

  const VerifyEntryOrderState();
}

class InitState extends VerifyEntryOrderState {

  const InitState();

  @override
  List<Object?> get props => [];
}

class LoadedEntryOrder extends VerifyEntryOrderState {
  final EntryOrder entryOrder;
  const LoadedEntryOrder(this.entryOrder);

  @override
  List<Object?> get props => [];
}