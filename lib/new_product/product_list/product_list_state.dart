import 'package:equatable/equatable.dart';
import 'package:erp_fronted/product/models/product_model.dart';

enum ProductListViewState { loading, loaded, initial }

class ProductListState extends Equatable {
  final Products? products;
  final ProductListViewState state;

  ProductListState init() {
    return const ProductListState();
  }

  ProductListState clone() {
    return const ProductListState();
  }

  ProductListState productsLoaded({
    required Products products,
    required ProductListViewState state,
  }) {
    return ProductListState(
      products: products,
      state: state,
    );
  }

  @override
  List<Object?> get props => [];

  const ProductListState(
      {this.products, this.state = ProductListViewState.initial});
}
