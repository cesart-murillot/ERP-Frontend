import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'register_entry_order_bloc.dart';
import 'register_entry_order_event.dart';
import 'register_entry_order_state.dart';

class RegisterEntryOrderPage extends StatelessWidget {
  const RegisterEntryOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          RegisterEntryOrderBloc()..add(const InitEvent()),
      child: Scaffold(
        appBar: AppBar(),
        body: const EntryOrderForm(),
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
              TextFormField(
                decoration: const InputDecoration(labelText: 'Código de Orden'),
              ),
              const ProductList()
            ],
          ),
        );
      },
    );
  }
}

class ProductList extends StatelessWidget {
  final int example = 5;

  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
        itemCount: example,
        itemBuilder: (context, index) {
          return const ProductInformation();
        });
  }
}

class ProductInformation extends StatelessWidget {
  const ProductInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 4,
          child: TextFormField(
            decoration: const InputDecoration(labelText: 'Producto'),
          ),
        ),
        Flexible(
          flex: 1,
          child: TextFormField(
            decoration: const InputDecoration(labelText: 'Cantidad'),
          ),
        )
      ],
    );
  }
}
