import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'detail_product_inventory_bloc.dart';
import 'detail_product_inventory_event.dart';
import 'detail_product_inventory_state.dart';

class DetailProductInventoryPage extends StatelessWidget {
  const DetailProductInventoryPage({Key? key, required this.productId})
      : super(key: key);
  final int productId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          DetailProductInventoryBloc()..add(InitEvent(productId)),
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
    return BlocBuilder<DetailProductInventoryBloc, DetailProductInventoryState>(
      builder: (context, state) {
        switch (state.state) {
          case States.initial:
            return const Center(
              child: Text(
                'Initial State',
              ),
            );
          case States.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case States.loaded:
            return const DetailProductInventory();
          case States.error:
            return Center(
              child: Text(
                '${state.errorMessage}',
              ),
            );
        }
      },
    );
  }
}

class DetailProductInventory extends StatelessWidget {
  const DetailProductInventory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          ProductDetail(),
          EntryDetails(),
        ],
      ),
    );
  }
}

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product =
        BlocProvider.of<DetailProductInventoryBloc>(context).state.product;
    return Card(
        margin: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Modelo: ${product?.modelProduct}',
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Formato: ${product?.formatProduct}',
                  ),
                ],
              ),
              Container(),
            ],
          ),
        ));
  }
}

class EntryDetails extends StatelessWidget {
  const EntryDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final entries = BlocProvider.of<DetailProductInventoryBloc>(context)
        .state
        .entries!
        .entries;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        final entryDate = DateFormat('EEEE d MMMM, ' 'yy - HH:mm a')
            .format(DateTime.parse(entries[index].createdAt!));
        final entryOrderDate = DateFormat('EEEE d MMMM, ' 'yy - HH:mm a')
            .format(DateTime.parse(entries[index].entryOrderProduct!.entryOrder!.createdAt!));
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('Cantidad: ${entries[index].quantityEntry}'),
                  ],
                ),
                Row(
                  children: [
                    Text('Fecha de Ingreso: $entryDate'),
                  ],
                ),
                Row(
                  children: [
                    Text(
                        'Almacen ${entries[index].section?.warehouse?.nameWarehouse}'),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Text('Sección: ${entries[index].section?.nameSection}'),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    Text(
                      'Orden de Entrada: ${entries[index].entryOrderProduct?.entryOrder?.codeEntryOrder}',
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      'Cantidad: ${entries[index].entryOrderProduct?.quantity}',
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Fecha de Registro: $entryOrderDate',
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('Unidades Disponibles: ${entries[index].remainEntry}'),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
