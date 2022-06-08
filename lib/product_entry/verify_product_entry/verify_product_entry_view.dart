import 'package:erp_fronted/general_widget/warehouse_drop_down/warehouse_drop_down_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'verify_product_entry_bloc.dart';
import 'verify_product_entry_event.dart';
import 'verify_product_entry_state.dart';

class VerifyProductEntryPage extends StatelessWidget {
  const VerifyProductEntryPage({Key? key, required this.productEntryId})
      : super(key: key);
  final int productEntryId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          VerifyProductEntryBloc()..add(InitEvent(productEntryId)),
      child: Builder(
        builder: (context) => Scaffold(
          body: const StateViews(),
          appBar: AppBar(),
        ),
      ),
    );
  }
}

class StateViews extends StatelessWidget {
  const StateViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerifyProductEntryBloc, VerifyProductEntryState>(
      builder: (context, state) {
        switch (state.state) {
          case States.initial:
            return const Center(child: Text('Initial State'),);
          case States.loading:
            return const Center(child: CircularProgressIndicator(),);
          case States.loaded:
            return const ProductEntryInformation();
          case States.error:
            return Center(child: Text('${state.errorMessage}'),);
        }
      },
    );
  }
}

class ProductEntryInformation extends StatelessWidget {
  const ProductEntryInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productEntry = BlocProvider.of<VerifyProductEntryBloc>(context).state.productEntry;
    final registerDate = DateFormat('EEEE d MMMM, ' 'yy - HH:mm a').format(DateTime.parse(productEntry!.createdAt));
    return Column(
      children: [
        Text('Modelo: ${productEntry.product.modelProduct}'),
        Text('Formato: ${productEntry.product.formatProduct}'),
        Text('Orden de Ingreso: ${productEntry.entryOrder.codeEntryOrder}'),
        Text('Fecha de Verificación: $registerDate'),
        Text('Cantidad: ${productEntry.quantity}'),
        const WarehouseDropDownPage(),
        Container(),
      ],
    );
  }
}

