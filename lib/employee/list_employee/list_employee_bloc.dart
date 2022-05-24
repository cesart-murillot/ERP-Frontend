import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:erp_fronted/employee/models/employee_model.dart';
import 'package:erp_fronted/src/resources/get_object.dart';

import 'list_employee_event.dart';
import 'list_employee_state.dart';

class ListEmployeeBloc extends Bloc<ListEmployeeEvent, ListEmployeeState> {
  ListEmployeeBloc() : super(const ListEmployeeState().init()) {
    on<InitEvent>(_init);
    on<ShowEmployeeEvent>(_showEmployee);
  }

  void _init(InitEvent event, Emitter<ListEmployeeState> emit) async {
    emit(const ListEmployeeState().copyWith(currentState: ListEmployeeViewState.loadingState));
    final url = preDefinedUri('/api/employees', {'only': 'full_name'});
    final Employees employees = await getObject(url, Employees.serializer);
    emit(const ListEmployeeState().copyWith(currentState: ListEmployeeViewState.loadedState, employees: employees));
  }

  FutureOr<void> _showEmployee(ShowEmployeeEvent event, Emitter<ListEmployeeState> emit) {
    print(event.employeeID);
  }
}
