import 'dart:io';

import 'package:erp_fronted/employee/add_employee/add_employee_state.dart';
import 'package:erp_fronted/general_widget/branch_drop_down/branch_drop_down_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'add_employee_bloc.dart';
import 'add_employee_event.dart';

class AddEmployeePage extends StatelessWidget {
  const AddEmployeePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          AddEmployeeBloc()..add(const InitEvent()),
      child: BlocConsumer<AddEmployeeBloc, AddEmployeeState>(
        buildWhen: (prevState, state) {
          if (prevState.currentState == AddEmployeeViewState.initialState ||
              state.currentState == AddEmployeeViewState.initialState) {
            return false;
          }
          return true;
        },
        builder: (context, state) {
          return Scaffold(
            body: EmployeeInformation(),
            appBar: AppBar(),
          );
        },
        listener: (BuildContext context, state) {
          switch (state.currentState) {
            case AddEmployeeViewState.initialState:
              print('iniital state');
              break;
            case AddEmployeeViewState.loadingState:
              print('loadingState');
              break;
            case AddEmployeeViewState.loadedState:
              // TODO: Handle this case.
              break;
            case AddEmployeeViewState.verificationState:
              showDialog(
                context: context,
                builder: (_) => BlocProvider.value(
                  value: BlocProvider.of<AddEmployeeBloc>(context),
                  child: const VerificationDialog(),
                ),
              );
              break;
          }
        },
      ),
    );
  }
}

class EmployeeInformation extends StatelessWidget {
  EmployeeInformation({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameEmployee = TextEditingController();
  final TextEditingController lastNameEmployee = TextEditingController();
  final TextEditingController ciEmployee = TextEditingController();
  final TextEditingController birthDateEmployee = TextEditingController();
  final TextEditingController branchID = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Card(
        margin: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const ImagePickerForm(),
                TextFormField(
                  onSaved: (value) {
                    value != null
                        ? nameEmployee.text = value
                        : print('No Name');
                  },
                  decoration: const InputDecoration(
                    labelText: 'Nombres',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                TextFormField(
                  onSaved: (value) {
                    value != null
                        ? lastNameEmployee.text = value
                        : print('No lastname');
                  },
                  decoration: const InputDecoration(
                      labelText: 'Apellidos',
                      prefixIcon: Icon(Icons.perm_contact_cal_outlined)),
                ),
                TextFormField(
                  onSaved: (value) {
                    value != null ? ciEmployee.text = value : print('no CI');
                  },
                  decoration: const InputDecoration(
                      labelText: 'CI', prefixIcon: Icon(Icons.perm_identity)),
                ),
                DatePickerForm(
                  onSavedCallback: (a) => (birthDateEmployee.text = a.text),
                ),
                BranchDropDownPage(
                  onSavedCallback: (a) => (branchID.text = a.text),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    _formKey.currentState?.save();
                    context.read<AddEmployeeBloc>().add(SaveEmployeeInfoEvent(
                          nameEmployee.text,
                          lastNameEmployee.text,
                          ciEmployee.text,
                          birthDateEmployee.text,
                          branchID.text,
                        ));
                  },
                  child: const Text('Registrar Empleado'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DatePickerForm extends StatefulWidget {
  const DatePickerForm({Key? key, required this.onSavedCallback})
      : super(key: key);
  final Function(TextEditingController) onSavedCallback;

  @override
  State<DatePickerForm> createState() => _DatePickerFormState();
}

class _DatePickerFormState extends State<DatePickerForm> {
  DateTime date = DateTime.now();
  var birthDateInputForm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: TextFormField(
            onTap: () async {
              DateTime? newDate = await showDatePicker(
                context: context,
                initialDate: date,
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
              );
              if (newDate == null) return;
              setState(() {
                date = newDate;
                birthDateInputForm.text = date.toString();
              });
            },
            readOnly: false,
            onSaved: (value) {
              birthDateInputForm.text = value!;
              widget.onSavedCallback(birthDateInputForm);
            },
            enabled: true,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.date_range),
              labelText: 'Fecha de Nacimiento',
            ),
            controller: birthDateInputForm,
          ),
        ),
      ],
    );
  }
}

class ImagePickerForm extends StatefulWidget {
  const ImagePickerForm({Key? key}) : super(key: key);

  @override
  State<ImagePickerForm> createState() => _ImagePickerFormState();
}

class _ImagePickerFormState extends State<ImagePickerForm> {
  File? image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 128.0,
          height: 128.0,
          child: image != null
              ? Image.network(
                  image!.path,
                  width: 128.0,
                  height: 128.0,
                  fit: BoxFit.scaleDown,
                )
              : const FlutterLogo(
                  size: 128.0,
                ),
        ),
        Wrap(
          children: [
            IconButton(
              onPressed: () {
                pickImage();
              },
              icon: const Icon(Icons.camera),
            ),
            IconButton(
              onPressed: () {
                upLoadPhoto();
              },
              icon: const Icon(Icons.upload_file),
            ),
            if (image != null)
              IconButton(
                onPressed: () {
                  removeImage();
                },
                icon: const Icon(Icons.delete),
              ),
          ],
        ),
      ],
    );
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);

      setState(() {
        this.image = imageTemporary;
      });
    } catch (e) {
      print('Failed to pick image ${e.toString()}');
    }
  }

  Future upLoadPhoto() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
  }

  void removeImage() {
    setState(() {
      image = null;
    });
  }
}

class VerificationDialog extends StatelessWidget {
  const VerificationDialog({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return BlocBuilder<AddEmployeeBloc, AddEmployeeState>(
      builder: (context, state) {
        return AlertDialog(
          title: const Text('Verificar Entrada de Productos'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'Cancelar');
                context.read<AddEmployeeBloc>().add(const InitEvent());
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                context
                    .read<AddEmployeeBloc>()
                    .add(const VerifyEmployeeInfoEvent());
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}
