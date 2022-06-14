import 'package:equatable/equatable.dart';
import 'package:erp_fronted/product/models/product_model.dart';

enum States { initial, loading, loaded, error }

class ProductInventoryState extends Equatable {
  final States state;
  final List<Product>? products;
  final String? errorMessage;
  final List<dynamic>? quantities;

  ProductInventoryState init() {
    return const ProductInventoryState();
  }

  ProductInventoryState clone() {
    return const ProductInventoryState();
  }

  ProductInventoryState loadedData({
    required States state,
    List<Product>? products,
    List<dynamic>? quantities,
  }) {
    return ProductInventoryState(
      state: state,
      products: products ?? this.products,
      quantities: quantities ?? this.quantities,
    );
  }

  @override
  List<Object?> get props => [state, products, errorMessage, quantities];

  const ProductInventoryState(
      {this.state = States.initial, this.products, this.errorMessage, this.quantities});
}
