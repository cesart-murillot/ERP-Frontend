import 'package:charts_flutter/flutter.dart' as charts;
import 'package:equatable/equatable.dart';

enum States { initial, loading, loaded, error }

class ProductSaleState extends Equatable {
  final String? errorMessage;
  final States state;
  final List<charts.Series<dynamic, String>>? quantity;
  final List<charts.Series<dynamic, String>>? income;

  ProductSaleState init() {
    return const ProductSaleState();
  }

  ProductSaleState clone() {
    return const ProductSaleState();
  }

  ProductSaleState loadedData({
    required States state,
    List<charts.Series<dynamic, String>>? quantity,
    List<charts.Series<dynamic, String>>? income,
  }) {
    return ProductSaleState(
      state: state,
      quantity: quantity ?? this.quantity,
      income: income ?? this.income
    );
  }

  ProductSaleState error({required String errorMessage}) {
    return ProductSaleState(
      state: States.error,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [errorMessage, state, quantity, income];

  const ProductSaleState(
      {this.errorMessage, this.state = States.initial, this.quantity, this.income});
}
