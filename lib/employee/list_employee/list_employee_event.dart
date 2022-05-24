import 'package:equatable/equatable.dart';

abstract class ListEmployeeEvent extends Equatable {
  const ListEmployeeEvent();
}

class InitEvent extends ListEmployeeEvent {
  @override
  List<Object?> get props => [];

  const InitEvent();
}

class ShowEmployeeEvent extends ListEmployeeEvent {
  final int employeeID;
  const ShowEmployeeEvent(this.employeeID);
  @override
  List<Object> get props => [employeeID];
}