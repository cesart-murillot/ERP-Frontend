import 'package:equatable/equatable.dart';

enum AddEmployeeViewState {
  initialState,
  loadingState,
  loadedState,
  verificationState
}

class AddEmployeeState extends Equatable {
  final String? nameEmployee;
  final String? lastNameEmployee;
  final String? ciEmployee;
  final String? birthdateEmployee;
  final int? branchID;
  final AddEmployeeViewState currentState;

  AddEmployeeState init() {
    return const AddEmployeeState();
  }

  AddEmployeeState clone() {
    return const AddEmployeeState();
  }

  AddEmployeeState copyWith({
    String? nameEmployee,
    String? lastNameEmployee,
    String? ciEmployee,
    String? birthdateEmployee,
    int? branchID,
    required AddEmployeeViewState state,
  }) {
    return AddEmployeeState(
      nameEmployee: nameEmployee ?? this.nameEmployee,
      lastNameEmployee: lastNameEmployee ?? this.lastNameEmployee,
      ciEmployee: ciEmployee ?? this.ciEmployee,
      birthdateEmployee: birthdateEmployee ?? this.birthdateEmployee,
      branchID: branchID ?? this.branchID,
      currentState: state,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        nameEmployee,
        lastNameEmployee,
        ciEmployee,
        birthdateEmployee,
        branchID,
        currentState,
      ];

  const AddEmployeeState(
      {this.nameEmployee,
      this.lastNameEmployee,
      this.ciEmployee,
      this.birthdateEmployee,
      this.branchID,
      this.currentState = AddEmployeeViewState.initialState});
}
