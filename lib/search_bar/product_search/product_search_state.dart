import 'package:equatable/equatable.dart';
import 'package:erp_fronted/product/models/product_model.dart';

enum States { initial, loading, loaded, error }

class ProductSearchState extends Equatable {
  final Products? products;
  final String? errorMessage;
  final States state;

  ProductSearchState init() {
    return const ProductSearchState();
  }

  ProductSearchState clone() {
    return const ProductSearchState();
  }

  ProductSearchState searchData({
    required States state,
    Products? products,
  }) {
    return ProductSearchState(
      state: state,
      products: products ?? this.products,
    );
  }

  ProductSearchState error({required String errorMessage}) {
    return ProductSearchState(errorMessage: errorMessage);
  }

  @override
  List<Object?> get props => [
        products,
        errorMessage,
        state,
      ];

  const ProductSearchState({
    this.products,
    this.errorMessage,
    this.state = States.initial,
  });
}
