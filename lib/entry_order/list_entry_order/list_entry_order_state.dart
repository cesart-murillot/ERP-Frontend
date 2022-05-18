import 'package:equatable/equatable.dart';
import 'package:erp_fronted/entry_order/models/entry_order_model.dart';

abstract class ListEntryOrderState extends Equatable {

  const ListEntryOrderState();
}

class InitState extends ListEntryOrderState {
  @override
  List<Object?> get props => [];

  const InitState();
}

class FetchingListState extends ListEntryOrderState {

  const FetchingListState();

  @override
  List<Object?> get props => [];
}

class LoadedListState extends ListEntryOrderState {
  final EntryOrders entryOrders;

  const LoadedListState(this.entryOrders);

  @override
  List<Object?> get props => [entryOrders];
}

class ErrorState extends ListEntryOrderState {
  final String error;

  const ErrorState(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}