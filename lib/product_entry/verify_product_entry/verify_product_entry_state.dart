import 'package:equatable/equatable.dart';
import 'package:erp_fronted/product_entry/models/product_entry_model.dart';

enum States { initial, loading, loaded, error, verified }

class VerifyProductEntryState extends Equatable {
  final States state;
  final ProductEntry? productEntry;
  final String? errorMessage;

  final int? quantity;
  final int? sectionId;

  VerifyProductEntryState init() {
    return const VerifyProductEntryState();
  }

  VerifyProductEntryState clone() {
    return const VerifyProductEntryState();
  }

  VerifyProductEntryState loadedData({
    ProductEntry? productEntry,
    required States state,
    int? quantity,
    int? sectionId,
  }) {
    return VerifyProductEntryState(
      productEntry: productEntry ?? this.productEntry,
      state: state,
      quantity: quantity ?? this.quantity,
      sectionId: sectionId ?? this.sectionId,
    );
  }

  VerifyProductEntryState error({required String errorMessage}) {
    return VerifyProductEntryState(
        state: States.error, errorMessage: errorMessage);
  }

  @override
  List<Object?> get props => [state, productEntry, errorMessage, quantity, sectionId];

  const VerifyProductEntryState({
    this.state = States.initial,
    this.productEntry,
    this.errorMessage,
    this.quantity,
    this.sectionId,
  });
}
