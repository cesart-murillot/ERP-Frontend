import 'package:equatable/equatable.dart';
import 'package:erp_fronted/product_entry/models/product_entry_model.dart';

enum States { initial, loading, loaded, error }

class IndexProductEntryState extends Equatable {
  final States state;
  final ProductEntries? productEntries;
  final String? errorString;

  IndexProductEntryState init() {
    return const IndexProductEntryState();
  }

  IndexProductEntryState clone() {
    return const IndexProductEntryState();
  }

  IndexProductEntryState loadedData({
    required States state,
    ProductEntries? productEntries,
  }) {
    return IndexProductEntryState(
      state: state,
      productEntries: productEntries ?? this.productEntries,
    );
  }

  IndexProductEntryState error({
    required String errorString,
  }) {
    return IndexProductEntryState(
      state: States.error,
      errorString: errorString,
    );
  }

  @override
  List<Object?> get props => [state, productEntries, errorString];

  const IndexProductEntryState(
      {this.state = States.initial, this.productEntries, this.errorString});
}
