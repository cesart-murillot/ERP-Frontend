import 'dart:html';

import 'package:erp_fronted/entry_order/register_entry_order/add_new_product/add_new_product_cubit.dart';
import 'package:erp_fronted/entry_order/register_entry_order/add_new_product/add_new_product_view.dart';
import 'package:erp_fronted/entry_order/register_entry_order/get_product_list/get_product_list_cubit.dart';
import 'package:erp_fronted/entry_order/register_entry_order/register_entry/register_entry_cubit.dart';
import 'package:erp_fronted/entry_order/register_entry_order/register_entry/register_entry_view.dart';
import 'package:erp_fronted/src/resources/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'register_entry_order_bloc.dart';
import 'register_entry_order_event.dart';
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
      child: Form(
        key: _formKey,
        child: Scaffold(
          appBar: AppBar(
            actions: [IconButton(onPressed: () {
              _formKey.currentState?.save();
              //_createFormKey.currentState?.save();
/*
              context.read<ProductCreateSaveData>().printData();
*/
            }, icon: const Icon(Icons.save))],
          ),
          body: const EntryOrderForm(),
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
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(),
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
            print(value);
          },
          decoration: const InputDecoration(
            label: Text('Código - Orden de Ingreso')
          ),
        ),
        const ProductList(),
      ],
    );
  }
}

