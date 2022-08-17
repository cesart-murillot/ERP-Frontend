import 'package:equatable/equatable.dart';

enum States {initial, loading, loaded, error}
class ProductStockState extends Equatable {
  final String errorMessage;
  final States state;
  ProductStockState init() {
    return const ProductStockState();
  }

  ProductStockState clone() {
    return const ProductStockState();
  }

  const ProductStockState({this.errorMessage = '', this.state = States.initial});

  @override
  List<Object?> get props => [errorMessage, state];
}
