import 'package:equatable/equatable.dart';
import 'package:erp_fronted/sale/models/sale_model.dart';

enum States { initial, loading, loaded, error }

class ListSaleState extends Equatable {
  final States state;
  final String? errorMessage;
  final Sales? sales;

  ListSaleState init() {
    return const ListSaleState();
  }

  ListSaleState clone() {
    return const ListSaleState();
  }

  ListSaleState loadData({
    required States state,
    Sales? sales,
  }) {
    return ListSaleState(
      state: state,
      sales: sales ?? this.sales,
    );
  }

  @override
  List<Object?> get props => [state, errorMessage];

  const ListSaleState({
    this.sales,
    this.state = States.initial,
    this.errorMessage,
  });
}
