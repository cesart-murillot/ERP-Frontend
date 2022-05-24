import 'package:erp_fronted/employee/models/user_model.dart';
import 'package:erp_fronted/employee/show_employee/show_employee_state.dart';
import 'package:erp_fronted/general_widget/role_drop_down/role_drop_down_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/employee_model.dart';
import 'show_employee_bloc.dart';
import 'show_employee_event.dart';

class ShowEmployeePage extends StatelessWidget {
  const ShowEmployeePage({Key? key, required this.employeeID})
      : super(key: key);
  final int employeeID;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          ShowEmployeeBloc()..add(InitEvent(employeeID)),
      child: BlocConsumer<ShowEmployeeBloc, ShowEmployeeState>(
        builder: (context, state) => Scaffold(
          body: const ShowEmployee(),
          appBar: AppBar(
            title: const Text('Información de Empleado'),
          ),
        ),
        listener: (BuildContext context, state) {
          if (state.currentState == ShowEmployeeViewState.showUserDialog) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (_) => BlocProvider.value(
                value: BlocProvider.of<ShowEmployeeBloc>(context),
                child: UserForm(
                  employeeID: employeeID,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class ShowEmployee extends StatelessWidget {
  const ShowEmployee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowEmployeeBloc, ShowEmployeeState>(
      buildWhen: (prevState, currentState) {
        if (currentState.currentState == ShowEmployeeViewState.initial ||
            prevState.currentState == ShowEmployeeViewState.initial ||
            currentState.currentState == ShowEmployeeViewState.showUserDialog) {
          return false;
        }
        return true;
      },
      builder: (context, state) {
        switch (state.currentState) {
          case ShowEmployeeViewState.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ShowEmployeeViewState.loaded:
            return EmployeeInfo(
              employee: state.employee!,
            );
          case ShowEmployeeViewState.initial:
            return const Center(
              child: Text('Initial State'),
            );
          case ShowEmployeeViewState.showUserDialog:
            break;
        }
        return const Text('Error');
      },
    );
  }
}

class EmployeeInfo extends StatelessWidget {
  const EmployeeInfo({Key? key, required this.employee}) : super(key: key);
  final Employee employee;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const FlutterLogo(
                size: 200,
              ),
              Text('${employee.namesEmployee} ${employee.lastNameEmployee}'),
              Text('CI: ${employee.ciEmployee}'),
              Text('Fecha de Nacimeinto: ${employee.birthDateEmployee}'),
              employee.user != null
                  ? UserInfo(
                      user: employee.user!,
                    )
                  : TextButton(
                      onPressed: () {
                        context
                            .read<ShowEmployeeBloc>()
                            .add(const ShowUserFormEvent());
                      },
                      child: const Text('Generar Usuario'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Email: ${user.email}'),
      ],
    );
  }
}

class UserForm extends StatelessWidget {
  UserForm({Key? key, required this.employeeID}) : super(key: key);
  final int employeeID;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController roleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowEmployeeBloc, ShowEmployeeState>(
      builder: (context, state) {
        return AlertDialog(
          title: const Text('Crear Usuario'),
          content: Form(
            key: _formKey,
            child: Column(
              children: [
                Flexible(
                  child: TextFormField(
                    onSaved: (value) {
                    },
                    controller: emailController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.alternate_email),
                      labelText: 'Correo Electronico',
                    ),
                  ),
                ),
                RoleDropDownPage(
                    onSaveCallback: (a) => (roleController.text = a.text))
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'Cancel');
                context.read<ShowEmployeeBloc>().add(const ResetEvent());
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                _formKey.currentState?.save();
                //print('${emailController.text} ${roleController.text}');
                context.read<ShowEmployeeBloc>().add(SaveUserEvent(
                      employeeID,
                      int.parse(roleController.text),
                      emailController.text,
                    ));
              },
              child: const Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }
}
