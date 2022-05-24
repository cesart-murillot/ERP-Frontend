import 'package:equatable/equatable.dart';
import 'package:erp_fronted/employee/models/employee_model.dart';

enum ShowEmployeeViewState { loading, loaded, initial, showUserDialog }

class ShowEmployeeState extends Equatable {
  final ShowEmployeeViewState currentState;
  final Employee? employee;
  final bool showUserForm;

  ShowEmployeeState init() {
    return const ShowEmployeeState();
  }

  ShowEmployeeState clone() {
    return const ShowEmployeeState();
  }

  ShowEmployeeState showUserDialog() {
    return const ShowEmployeeState();
  }

  ShowEmployeeState copyWith({
    Employee? employee,
    required ShowEmployeeViewState currentState,
    bool? showUserForm,
  }) {
    return ShowEmployeeState(
      employee: employee ?? this.employee,
      currentState: currentState,
      showUserForm: showUserForm ?? this.showUserForm,
    );
  }

  @override
  List<Object?> get props => [employee, currentState];

  const ShowEmployeeState({
    this.currentState = ShowEmployeeViewState.initial,
    this.employee,
    this.showUserForm = false,
  });
}
