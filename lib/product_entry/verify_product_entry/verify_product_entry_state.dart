import 'package:equatable/equatable.dart';
import 'package:erp_fronted/product_entry/models/product_entry_model.dart';

enum States { initial, loading, loaded, error }

class VerifyProductEntryState extends Equatable {
  final States state;
  final ProductEntry? productEntry;
  final String? errorMessage;

  VerifyProductEntryState init() {
    return const VerifyProductEntryState();
  }

  VerifyProductEntryState clone() {
    return const VerifyProductEntryState();
  }

  VerifyProductEntryState loadedData({
    ProductEntry? productEntry,
    required States state,
  }) {
    return VerifyProductEntryState(
      productEntry: productEntry ?? this.productEntry,
      state: state,
    );
  }

  VerifyProductEntryState error({required String errorMessage}) {
    return VerifyProductEntryState(state: States.error, errorMessage: errorMessage);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [state, productEntry];

  const VerifyProductEntryState(
      {this.state = States.initial, this.productEntry, this.errorMessage});
}
