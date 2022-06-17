import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:erp_fronted/employee/models/employee_model.dart';
import 'package:erp_fronted/employee/models/user_model.dart';
import 'package:erp_fronted/src/resources/generic_serializer.dart';
import 'package:erp_fronted/src/resources/get_object.dart';
import 'package:erp_fronted/src/resources/post_object.dart';

import 'show_employee_event.dart';
import 'show_employee_state.dart';

class ShowEmployeeBloc extends Bloc<ShowEmployeeEvent, ShowEmployeeState> {
  ShowEmployeeBloc() : super(const ShowEmployeeState().init()) {
    on<InitEvent>(_init);
    on<ShowUserFormEvent>(_showUserForm);
    on<ResetEvent>(_reset);
    on<SaveUserEvent>(_saveUser);
  }

  void _init(InitEvent event, Emitter<ShowEmployeeState> emit) async {
    emit(state.copyWith(currentState: ShowEmployeeViewState.loading));
    final url = preDefinedUri('/api/employees/${event.employeeID}');

    final Employee employee = await getObject(url, Employee.serializer);
    emit(state.copyWith(
        currentState: ShowEmployeeViewState.loaded, employee: employee));
  }

  FutureOr<void> _showUserForm(
      ShowUserFormEvent event, Emitter<ShowEmployeeState> emit) {
    /*if (event.showUserForm) {
      emit(const ShowEmployeeState().copyWith(
          currentState: ShowEmployeeViewState.initial, showUserForm: true));
    }
    if (!event.showUserForm) {
      emit(const ShowEmployeeState().copyWith(
          currentState: ShowEmployeeViewState.initial, showUserForm: false));
    }*/
    emit(const ShowEmployeeState(currentState: ShowEmployeeViewState.showUserDialog));
  }

  FutureOr<void> _reset(ResetEvent event, Emitter<ShowEmployeeState> emit) {
    emit(state.copyWith(currentState: ShowEmployeeViewState.initial));
  }

  FutureOr<void> _saveUser(SaveUserEvent event, Emitter<ShowEmployeeState> emit) async {
    var user = User((user){
      user.email = event.email;
      user.employeeId = event.employeeID;
      user.roleId = event.roleID;
      user.password = 'a password will be added later';
    });
    var users = Users((users){
      users.users.add(user);
    });
    final url = preDefinedUri('/api/users/');
    final userString = objectToString(users, Users.serializer);
    print(userString);
    try {
      final String response = await postDataToApi(url, userString!);
      print(response);
    } catch (e) {
      print(e);
    }

  }
}
