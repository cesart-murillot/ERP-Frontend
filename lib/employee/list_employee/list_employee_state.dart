import 'package:equatable/equatable.dart';
import 'package:erp_fronted/employee/models/employee_model.dart';

enum ListEmployeeViewState {
  initialState,
  loadingState,
  loadedState,
}

class ListEmployeeState extends Equatable {
  final Employees? employees;
  final ListEmployeeViewState currentState;

  ListEmployeeState init() {
    return const ListEmployeeState();
  }

  ListEmployeeState clone() {
    return const ListEmployeeState();
  }

  ListEmployeeState copyWith({
    Employees? employees,
    required ListEmployeeViewState currentState,
  }) {
    return ListEmployeeState(
      employees: employees ?? this.employees,
      currentState: currentState,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        employees,
        currentState,
      ];

  const ListEmployeeState({
    this.employees,
    this.currentState = ListEmployeeViewState.initialState,
  });
}
