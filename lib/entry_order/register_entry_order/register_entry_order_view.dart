import 'package:erp_fronted/entry_order/register_entry_order/add_new_product/add_new_product_cubit.dart';
import 'package:erp_fronted/entry_order/register_entry_order/add_new_product/add_new_product_view.dart';
import 'package:erp_fronted/entry_order/register_entry_order/get_product_list/get_product_list_cubit.dart';
import 'package:erp_fronted/entry_order/register_entry_order/register_entry/register_entry_cubit.dart';
import 'package:erp_fronted/entry_order/register_entry_order/register_entry_order_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'register_entry_order_bloc.dart';
import 'register_entry_order_state.dart';

class RegisterEntryOrderPage extends StatelessWidget {
  RegisterEntryOrderPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => RegisterEntryOrderBloc()),
        BlocProvider(
          create: (_) => RegisterEntryCubit(),
        ),
        BlocProvider(create: (_) => AddNewProductCubit()),
        BlocProvider(create: (_) => GetProductListCubit()),
      ],
      child: Builder(
        builder: (context) => Form(
          key: _formKey,
          child: Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      _formKey.currentState?.save();

                      showDialog(
                        context: context,
                        builder: (_) =>
                            BlocProvider<RegisterEntryOrderBloc>.value(
                          value:
                              BlocProvider.of<RegisterEntryOrderBloc>(context),
                          child: const VerificationDialog(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.save))
              ],
            ),
            body: const EntryOrderForm(),
          ),
        ),
      ),
    );
  }
}

class EntryOrderForm extends StatelessWidget {
  const EntryOrderForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterEntryOrderBloc, RegisterEntryOrderState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Flexible(
                    flex: 2,
                    child: SizedBox(),
                  ),
                  Flexible(
                    flex: 1,
                    child: TextButton(
                      onPressed: () {
                        context.read<GetProductListCubit>().getProduct();
                        context.read<AddNewProductCubit>().addInputField();
                      },
                      child: const Text('Añadir Producto'),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: TextButton(
                      onPressed: () {
                        context.read<AddNewProductCubit>().removeInputField();
                      },
                      child: const Text('Remover Producto'),
                    ),
                  )
                ],
              ),
              const EntryOrderInformation(),
            ],
          ),
        );
      },
    );
  }
}

class EntryOrderInformation extends StatelessWidget {
  const EntryOrderInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          onSaved: (value) {
            BlocProvider.of<RegisterEntryOrderBloc>(context)
                .add(StoreCodeEvent(value!));
          },
          decoration: const InputDecoration(
            label: Text(
              'Código - Orden de Ingreso',
            ),
            border: OutlineInputBorder()
          ),
        ),
        const SizedBox(height: 16.0,),
        const ProductList(),
      ],
    );
  }
}

class VerificationDialog extends StatelessWidget {
  const VerificationDialog({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return BlocBuilder<RegisterEntryOrderBloc, RegisterEntryOrderState>(
      builder: (context, state) {
        return AlertDialog(
          title: const Text('Registar Orden de Ingreso'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'Cancelar');
                context
                    .read<RegisterEntryOrderBloc>()
                    .add(const ClearMapList());
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                context.read<RegisterEntryOrderBloc>().add(const SaveData());
                Navigator.pop(context);
                Navigator.pop(context, 'Orden de Ingreso Registrada');
              },
              child: const Text('Registrar'),
            ),
          ],
        );
      },
    );
  }
}
