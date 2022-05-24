import 'package:equatable/equatable.dart';

abstract class ShowEmployeeEvent extends Equatable {
  const ShowEmployeeEvent();
}

class InitEvent extends ShowEmployeeEvent {
  final int employeeID;
  @override
  List<Object?> get props => [employeeID];

  const InitEvent(this.employeeID);
}

class ResetEvent extends ShowEmployeeEvent {
  const ResetEvent();

  @override
  List<Object> get props => [];
}

class ShowUserFormEvent extends ShowEmployeeEvent {
  const ShowUserFormEvent();
  @override
  List<Object> get props => [];
}

class SaveUserEvent extends ShowEmployeeEvent {
  final int employeeID;
  final int roleID;
  final String email;
  const SaveUserEvent(this.employeeID, this.roleID, this.email);
  @override
  List<Object> get props => [employeeID, roleID, email];
}
