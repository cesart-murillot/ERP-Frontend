import 'package:equatable/equatable.dart';
import 'package:erp_fronted/product/models/product_model.dart';

enum States { initial, loading, loaded, error }

class WarehouseProductState extends Equatable {
  final States state;
  final String? errorMessage;
  final Products? products;

  WarehouseProductState init() {
    return const WarehouseProductState();
  }

  WarehouseProductState clone() {
    return const WarehouseProductState();
  }

  WarehouseProductState loadedData({
    required States state,
    Products? products,
  }) {
    return WarehouseProductState(
      state: state,
      products: products ?? this.products,
    );
  }

  WarehouseProductState error({required String errorMessage}) {
    return WarehouseProductState(
      state: States.error,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [state];

  const WarehouseProductState({
    this.state = States.initial,
    this.errorMessage,
    this.products,
  });
}
