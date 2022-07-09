import 'package:equatable/equatable.dart';
import 'package:erp_fronted/product_request/models/transfer_model.dart';

enum States { initial, loading, loaded, error }

class ProductTransferState extends Equatable {
  final States state;
  final String? errorMessage;
  final Transfers? transfers;

  ProductTransferState init() {
    return const ProductTransferState();
  }

  ProductTransferState clone() {
    return const ProductTransferState();
  }

  ProductTransferState error({required String errorMessage}) {
    return ProductTransferState(
      state: States.error,
      errorMessage: errorMessage,
    );
  }

  ProductTransferState loadedData({
    required States state,
    Transfers? transfers,
  }) {
    return ProductTransferState(
      state: state,
      transfers: transfers ?? this.transfers,
    );
  }

  @override
  List<Object?> get props => [
        state,
        errorMessage,
        transfers,
      ];

  const ProductTransferState({
    this.state = States.initial,
    this.errorMessage,
    this.transfers,
  });
}
