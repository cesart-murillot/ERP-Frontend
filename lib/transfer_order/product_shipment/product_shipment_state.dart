import 'package:equatable/equatable.dart';
import 'package:erp_fronted/transfer_order/models/transfer_order_model.dart';

enum States { initial, loading, loaded, error }

class ProductShipmentState extends Equatable {
  final States state;
  final TransferOrders? transferOrders;
  final String? errorMessage;

  ProductShipmentState init() {
    return const ProductShipmentState();
  }

  ProductShipmentState clone() {
    return const ProductShipmentState();
  }

  ProductShipmentState loadingData({
    TransferOrders? transferOrders,
    required States state,
  }) {
    return ProductShipmentState(
      transferOrders: transferOrders,
      state: state,
    );
  }

  ProductShipmentState error(String errorMessage) {
    return ProductShipmentState(
      state: States.error,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        state,
        transferOrders,
        errorMessage,
      ];

  const ProductShipmentState({
    this.state = States.initial,
    this.transferOrders,
    this.errorMessage,
  });
}
