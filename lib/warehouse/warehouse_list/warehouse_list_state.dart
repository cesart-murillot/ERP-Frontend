import 'package:equatable/equatable.dart';
import 'package:erp_fronted/branch/models/branch_model.dart';

enum States { initial, loading, loaded, error }

class WarehouseListState extends Equatable {
  final States state;
  final bool isAdmin;
  final Branches? branches;
  final Branch? branch;
  final String? errorMessage;

  WarehouseListState init() {
    return const WarehouseListState();
  }

  WarehouseListState clone() {
    return const WarehouseListState();
  }

  WarehouseListState loadedData({
    required States state,
    required bool isAdmin,
    Branches? branches,
    Branch? branch,
  }) {
    return WarehouseListState(
      state: state,
      isAdmin: isAdmin,
      branches: branches ?? this.branches,
      branch: branch ?? this.branch,
    );
  }

  WarehouseListState error({required String errorMessage}) {
    return WarehouseListState(
      state: States.error,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        state,
        isAdmin,
        branches,
        branch,
        errorMessage,
      ];

  const WarehouseListState({
    this.state = States.initial,
    this.isAdmin = false,
    this.branches,
    this.branch,
    this.errorMessage,
  });
}
