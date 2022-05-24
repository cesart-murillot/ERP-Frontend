import 'package:equatable/equatable.dart';
import 'package:erp_fronted/product/models/product_model.dart';

enum CustomState {initialState, loadingState, loadedState}
class ProductRequestState extends Equatable {

  final Products? products;
  final CustomState state;

  ProductRequestState init() {
    return const ProductRequestState();
  }

  ProductRequestState clone() {
    return const ProductRequestState();
  }

  ProductRequestState copyWith({Products? products, CustomState? state}) {
    return ProductRequestState(
      products: products ?? this.products,
      state: state ?? this.state,
    );
  }

  @override
  List<Object?> get props => [products, state];

  const ProductRequestState({this.products, this.state = CustomState.initialState});
}
