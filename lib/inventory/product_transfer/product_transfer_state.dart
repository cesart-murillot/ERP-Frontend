import 'package:equatable/equatable.dart';
import 'package:erp_fronted/product_request/models/transfer_model.dart';

enum States { initial, loading, loaded, error }

class ProductTransferState extends Equatable {
  final States state;
  final String? errorMessage;
  final Transfers? transfers;
  final int roleId;

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
    int? roleId,
  }) {
    return ProductTransferState(
      state: state,
      transfers: transfers ?? this.transfers,
      roleId: roleId ?? this.roleId,
    );
  }

  @override
  List<Object?> get props => [
        state,
        errorMessage,
        transfers,
        roleId,
      ];

  const ProductTransferState({
    this.state = States.initial,
    this.errorMessage,
    this.transfers,
    this.roleId = 0,
  });
}
