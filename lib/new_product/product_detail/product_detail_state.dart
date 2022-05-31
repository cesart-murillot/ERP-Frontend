import 'package:equatable/equatable.dart';
import 'package:erp_fronted/product/models/product_model.dart';

enum ProductDetailViewState { loading, loaded, initial }

class ProductDetailState extends Equatable {
  final Product? product;
  final ProductDetailViewState state;

  ProductDetailState init() {
    return const ProductDetailState();
  }

  ProductDetailState clone() {
    return const ProductDetailState();
  }

  ProductDetailState productData({
    Product? product,
    required ProductDetailViewState state,
  }) {
    return ProductDetailState(
      product: product ?? this.product,
      state: state,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [product, state];

  const ProductDetailState(
      {this.product, this.state = ProductDetailViewState.initial});
}
