import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:erp_fronted/employee/models/employee_model.dart';
import 'package:erp_fronted/src/resources/generic_serializer.dart';
import 'package:erp_fronted/src/resources/product_api_provider.dart';
import 'package:erp_fronted/src/resources/repository.dart';
import 'package:flutter/material.dart';

import '../../module/models/module_model.dart';
import '../../product/views/product_page.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final Repository repository;

  MainBloc(this.repository) : super(const InitialState()) {
    on<GetEmployeeInfoEvent>(_getEmployeeInfo);
    on<RedirectToPage>(_redirectToPage);
  }

  Future<void> _getEmployeeInfo(
    GetEmployeeInfoEvent event,
    Emitter<MainState> emitter,
  ) async {
    emitter(const LoadingInfoState());
    try {
      final String modulesString = await repository.fetchData(UnEncodePath.modules);
      final Modules modules = parseObject(modulesString, Modules.serializer);

/*      final String userString = await repository.fetchData(UnEncodePath.users, '1');
      final User user = parseObject(userString, User.serializer);*/

      final String employeeString = await repository.fetchData(UnEncodePath.employees, '1');
      final Employee employee = parseObject(employeeString, Employee.serializer);
/*
      print(employee);
      //print(employee);*/
      
      emitter(LoadedInfoState(modules, employee));
    } catch (e) {
      //print('nono');
      emitter(const ErrorLoadingInfoState());
    }
  }

  Future<void> _redirectToPage(RedirectToPage event, Emitter<MainState> emitter) async {
    if (event.page == 'product') {
      emitter(const RedirectingToPage(ProductPage()));
    }
  }
}
