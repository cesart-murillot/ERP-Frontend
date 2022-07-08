import 'package:equatable/equatable.dart';
import 'package:erp_fronted/product/models/product_model.dart';

enum States { initial, loading, loaded, error }

class ProductPerBranchState extends Equatable {
  final States state;
  final Products? products;
  final String? errorMessage;

  ProductPerBranchState init() {
    return const ProductPerBranchState();
  }

  ProductPerBranchState clone() {
    return const ProductPerBranchState();
  }

  ProductPerBranchState loadedData({
    required States state,
    Products? products,
  }) {
    return ProductPerBranchState(
      state: state,
      products: products ?? this.products,
    );
  }

  ProductPerBranchState error({required String errorMessage}) {
    return ProductPerBranchState(
      state: States.error,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        state,
        products,
        errorMessage,
      ];

  const ProductPerBranchState({
    this.state = States.initial,
    this.products,
    this.errorMessage,
  });
}
