import 'package:equatable/equatable.dart';
import 'package:erp_fronted/product/models/product_model.dart';

enum States { initial, loading, loaded, error }

class GenerateSaleState extends Equatable {
  final States state;
  final String errorMessage;
  final List<Product> products;

  GenerateSaleState init() {
    return const GenerateSaleState();
  }

  GenerateSaleState clone({
    required States state,
    List<Product>? products,
  }) {
    return GenerateSaleState(
      state: state,
      products: products ?? this.products,
    );
  }

  GenerateSaleState error({required String errorMessage}) {
    return GenerateSaleState(
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

  const GenerateSaleState({
    this.products = const [],
    this.state = States.loaded,
    this.errorMessage = '',
  });
}
