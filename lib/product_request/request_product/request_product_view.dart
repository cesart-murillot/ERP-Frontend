import 'package:erp_fronted/branch/models/branch_model.dart';
import 'package:erp_fronted/employee/models/user_model.dart';
import 'package:erp_fronted/product_request/request_product/form_generator/form_generator_view.dart';
import 'package:erp_fronted/product_request/request_product/product_dropdown/product_dropdown_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'request_product_bloc.dart';
import 'request_product_event.dart';
import 'request_product_state.dart';

class RequestProductPage extends StatelessWidget {
  RequestProductPage({Key? key}) : super(key: key);
  final GlobalKey<FormState> _form = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RequestProductBloc()..add(InitEvent()),
      child: Builder(
          builder: (context) => Form(
                key: _form,
                child: Scaffold(
                  body: const RequestProduct(),
                  appBar: AppBar(
                    actions: [
                      IconButton(
                        onPressed: () {
                          _form.currentState?.save();
                          showDialog(
                            context: context,
                            builder: (_) => BlocProvider.value(
                              value:
                                  BlocProvider.of<RequestProductBloc>(context),
                              child: const VerificationDialog(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
              )),
    );
  }
}

class RequestProduct extends StatelessWidget {
  const RequestProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestProductBloc, RequestProductState>(
      builder: (context, state) {
        switch (state.state) {
          case RequestProductViewState.initial:
            return const Center(
              child: Text('Cargando...'),
            );
            break;
          case RequestProductViewState.loaded:
            if (state.user != null && state.branch != null) {
              return RequestForm(
                user: state.user,
                branch: state.branch,
              );
            }
            return const Center(
              child: Text('No hay informacion del usuario'),
            );
          case RequestProductViewState.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          default:
            return const Center(
              child: Text('Error'),
            );
        }
      },
    );
  }
}

class RequestForm extends StatelessWidget {
  const RequestForm({Key? key, required this.user, this.branch})
      : super(key: key);
  final User? user;
  final Branch? branch;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestProductBloc, RequestProductState>(
      builder: (context, state) {
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Se realizara la solicitud como:\n${user?.employee?.namesEmployee} ${user?.employee?.lastNameEmployee}',
                  style: const TextStyle(fontSize: 18.0),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Cargo: ${user?.role?.nameRole}',
                  style: const TextStyle(fontSize: 18.0),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Contacto: ${user?.email}',
                  style: const TextStyle(fontSize: 18.0),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Para: ${branch?.nameBranch}',
                  style: const TextStyle(fontSize: 18.0),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Dirección: ${branch!.addressBranch}',
                  style: const TextStyle(fontSize: 18.0),
                ),
                const FormGeneratorPage(element: ProductQuantity()),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ProductQuantity extends StatelessWidget {
  const ProductQuantity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestProductBloc, RequestProductState>(
      builder: (context, state) {
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Flexible(
                flex: 3,
                child: ProductDropdownPage(),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Flexible(
                flex: 1,
                child: TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onSaved: (value) {
                    context
                        .read<RequestProductBloc>()
                        .add(AddQuantityEvent(int.parse(value!)));
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Cantidad',
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class VerificationDialog extends StatelessWidget {
  const VerificationDialog({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return BlocBuilder<RequestProductBloc, RequestProductState>(
      builder: (context, state) {
        return AlertDialog(
          title: const Text('Generar Solicitud'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'Cancelar');
                context.read<RequestProductBloc>().add(const ClearDataEvent());
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                context.read<RequestProductBloc>().add(const SaveDataEvent());
                Navigator.pop(context);
                Navigator.pop(context, true);
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}
