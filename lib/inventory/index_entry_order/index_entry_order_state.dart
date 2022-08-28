import 'package:equatable/equatable.dart';
import 'package:erp_fronted/entry_order/models/entry_order_model.dart';

enum States {
  initial,
  loading,
  loaded,
  error
}

class IndexEntryOrderState extends Equatable {
  final States state;
  final String? errorString;
  final EntryOrders? entryOrders;

  IndexEntryOrderState init() {
    return const IndexEntryOrderState();
  }

  IndexEntryOrderState clone({
    required States state,
    EntryOrders? entryOrders,
  }) {
    return IndexEntryOrderState(
      state: state,
      entryOrders: entryOrders ?? this.entryOrders,
    );
  }

  IndexEntryOrderState loaded({
    required States state,
    EntryOrders? entryOrders,
  }) {
    return IndexEntryOrderState(
      state: state,
      entryOrders: entryOrders ?? this.entryOrders,
    );
  }

  IndexEntryOrderState error({required String errorString}) {
    return IndexEntryOrderState(state: States.error, errorString: errorString);
  }

  @override
  List<Object?> get props => [state, errorString, entryOrders];

  const IndexEntryOrderState(
      {this.state = States.initial, this.errorString, this.entryOrders});
}
