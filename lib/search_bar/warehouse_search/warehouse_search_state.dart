import 'package:equatable/equatable.dart';
import 'package:erp_fronted/branch/models/warehouse_model.dart';

enum States { initial, loading, loaded, error }

class WarehouseSearchState extends Equatable {
  final Warehouses? warehouses;
  final String errorMessage;
  final States state;

  WarehouseSearchState init() {
    return const WarehouseSearchState();
  }

  WarehouseSearchState clone({
    required States state,
    Warehouses? warehouses,
  }) {
    return WarehouseSearchState(
      state: state,
      warehouses: warehouses ?? this.warehouses,
    );
  }

  WarehouseSearchState error({required String errorMessage}) {
    return WarehouseSearchState(state: States.error, errorMessage: errorMessage);
  }

  @override
  List<Object?> get props => [
        warehouses,
        errorMessage,
        state,
      ];

  const WarehouseSearchState({
    this.warehouses,
    this.errorMessage = '',
    this.state = States.initial,
  });
}
