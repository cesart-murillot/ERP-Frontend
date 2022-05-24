import 'package:equatable/equatable.dart';

abstract class AddEmployeeEvent extends Equatable {
  const AddEmployeeEvent();
}

class InitEvent extends AddEmployeeEvent {
  @override
  List<Object?> get props => [];

  const InitEvent();
}

class SaveEmployeeInfoEvent extends AddEmployeeEvent {
  final String nameEmployee;
  final String lastNameEmployee;
  final String ciEmployee;
  final String birthdayEmployee;
  final String branchID;

  const SaveEmployeeInfoEvent(
    this.nameEmployee,
    this.lastNameEmployee,
    this.ciEmployee,
    this.birthdayEmployee,
    this.branchID,
  );

  @override
  List<Object> get props =>
      [nameEmployee, lastNameEmployee, ciEmployee, birthdayEmployee];
}

class VerifyEmployeeInfoEvent extends AddEmployeeEvent {
  @override
  List<Object?> get props => [];

  const VerifyEmployeeInfoEvent();
}
