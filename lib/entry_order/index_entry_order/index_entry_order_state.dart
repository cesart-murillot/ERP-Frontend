import 'package:equatable/equatable.dart';
import 'package:erp_fronted/entry_order/models/entry_order_model.dart';

enum States { initial, loading, loadedAll, loadedVerified, loadedPendent, error }

class IndexEntryOrderState extends Equatable {
  final States state;
  final String? errorString;
  final EntryOrders? entryOrders;
  IndexEntryOrderState init() {
    return const IndexEntryOrderState();
  }

  IndexEntryOrderState clone() {
    return const IndexEntryOrderState();
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

  const IndexEntryOrderState({this.state = States.initial, this.errorString, this.entryOrders});
}
