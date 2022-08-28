import 'package:equatable/equatable.dart';
import 'package:erp_fronted/product/models/product_model.dart';

enum States { initial, loading, loaded, error }

class ProductDropDownState extends Equatable {
  final States state;
  final String errorMessage;
  final Products? products;

  ProductDropDownState init() {
    return const ProductDropDownState();
  }

  ProductDropDownState clone({
    required States state,
    Products? products,
  }) {
    return ProductDropDownState(
      state: state,
      products: products ?? this.products,
    );
  }

  ProductDropDownState error({required String errorMessage}) {
    return ProductDropDownState(
      state: States.error,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        state,
        errorMessage,
        products,
      ];

  const ProductDropDownState({
    this.state = States.initial,
    this.errorMessage = '',
    this.products,
  });
}
