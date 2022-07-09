import 'package:equatable/equatable.dart';
import 'package:erp_fronted/product_request/models/transfer_model.dart';

enum States { initial, loading, loaded, error }

class ProductTransferDetailState extends Equatable {
  final States state;
  final String? errorMessage;
  final Transfer? transfer;

  ProductTransferDetailState init() {
    return const ProductTransferDetailState();
  }

  ProductTransferDetailState clone() {
    return const ProductTransferDetailState();
  }

  ProductTransferDetailState loadedData(
      {required States state, Transfer? transfer}) {
    return ProductTransferDetailState(
      state: state,
      transfer: transfer ?? this.transfer,
    );
  }

  ProductTransferDetailState error({required String errorMessage}) {
    return ProductTransferDetailState(
      state: States.error,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        state,
        errorMessage,
        transfer,
      ];

  const ProductTransferDetailState({
    this.state = States.initial,
    this.errorMessage,
    this.transfer,
  });
}
