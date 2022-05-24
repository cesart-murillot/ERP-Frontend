import 'package:erp_fronted/employee/add_employee/add_employee_view.dart';
import 'package:erp_fronted/employee/models/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../show_employee/show_employee_view.dart';
import 'list_employee_bloc.dart';
import 'list_employee_event.dart';
import 'list_employee_state.dart';

class ListEmployeePage extends StatelessWidget {
  const ListEmployeePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          ListEmployeeBloc()..add(const InitEvent()),
      child: Scaffold(
        body: const ListEmployee(),
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AddEmployeePage()),
            );
          },
          label: const Text('Registar Empleado'),
        ),
      ),
    );
  }
}

class ListEmployee extends StatelessWidget {
  const ListEmployee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListEmployeeBloc, ListEmployeeState>(
      builder: (context, state) {
        switch (state.currentState) {
          case ListEmployeeViewState.initialState:
            return const Center(
              child: Text('Inital State'),
            );
            break;
          case ListEmployeeViewState.loadingState:
            return const Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ListEmployeeViewState.loadedState:
            return ListOfEmployees(employees: state.employees!);
            break;
          default:
            return const Center(
              child: Text('Serious error'),
            );
        }
        return const Center(
          child: Text('No state'),
        );
      },
    );
  }
}

class ListOfEmployees extends StatelessWidget {
  const ListOfEmployees({Key? key, required this.employees}) : super(key: key);
  final Employees employees;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: employees.employees.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ShowEmployeePage(
                            employeeID: employees.employees[index].id!,
                          )));
              context
                  .read<ListEmployeeBloc>()
                  .add(ShowEmployeeEvent(employees.employees[index].id!));
            },
            title: Text(
                '${employees.employees[index].lastNameEmployee}, ${employees.employees[index].namesEmployee}'),
          ),
        );
      },
    );
  }
}
