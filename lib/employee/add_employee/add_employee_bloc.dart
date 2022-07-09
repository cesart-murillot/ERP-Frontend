import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:erp_fronted/employee/models/employee_model.dart';
import 'package:erp_fronted/src/resources/generic_serializer.dart';
import 'package:erp_fronted/src/resources/post_object.dart';

import '../../src/resources/get_object.dart';
import 'add_employee_event.dart';
import 'add_employee_state.dart';

class AddEmployeeBloc extends Bloc<AddEmployeeEvent, AddEmployeeState> {
  AddEmployeeBloc() : super(const AddEmployeeState().init()) {
    on<InitEvent>(_init);
    on<SaveEmployeeInfoEvent>(_saveEmployeeInfo);
    on<VerifyEmployeeInfoEvent>(_verifyEmployeeInfo);
  }

  void _init(InitEvent event, Emitter<AddEmployeeState> emit) async {
    emit(state.clone());
  }

  FutureOr<void> _saveEmployeeInfo(
      SaveEmployeeInfoEvent event, Emitter<AddEmployeeState> emit) {
/*    print(
        '${event.nameEmployee} ${event.lastNameEmployee} ${event.ciEmployee} ${event.birthdayEmployee} ${event.branchID}');*/
    emit(const AddEmployeeState().copyWith(
      nameEmployee: event.nameEmployee,
      lastNameEmployee: event.nameEmployee,
      ciEmployee: event.ciEmployee,
      birthdateEmployee: event.birthdayEmployee,
      branchID: int.parse(event.branchID),
      state: AddEmployeeViewState.verificationState,
    ));
  }

  FutureOr<void> _verifyEmployeeInfo(VerifyEmployeeInfoEvent event, Emitter<AddEmployeeState> emit) async {
    var employee = Employee((employee){
      employee.namesEmployee = state.nameEmployee;
      employee.lastNameEmployee = state.lastNameEmployee;
      employee.ciEmployee = state.ciEmployee;
      employee.birthDateEmployee = state.birthdateEmployee;
      employee.branchID = state.branchID;
    });
    var employees = Employees((employees){
      employees.employees.add(employee);
    });
    try {
      final url = preDefinedUri('/api/employees/');
      final employeeString = objectToString(employees, Employees.serializer);
      final String response = await postDataToApi(url, employeeString!);
    } catch (e) {
      print(e.toString());
    }
  }
}
