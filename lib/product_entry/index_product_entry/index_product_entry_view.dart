import 'package:erp_fronted/product_entry/verify_product_entry/verify_product_entry_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'index_product_entry_bloc.dart';
import 'index_product_entry_event.dart';
import 'index_product_entry_state.dart';

class IndexProductEntryPage extends StatelessWidget {
  const IndexProductEntryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          IndexProductEntryBloc()..add(InitEvent()),
      child: Builder(builder: (context) => const StateViews()),
    );
  }
}

class StateViews extends StatelessWidget {
  const StateViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndexProductEntryBloc, IndexProductEntryState>(
      builder: (context, state) {
        switch (state.state) {
          case States.initial:
            return const Center(
              child: Text(
                'State Initial',
              ),
            );
          case States.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case States.loaded:
            return const IndexProductEntry();
          case States.error:
            return Center(
              child: Text(
                '${state.errorString}',
              ),
            );
        }
      },
    );
  }
}

class IndexProductEntry extends StatelessWidget {
  const IndexProductEntry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productEntries = BlocProvider.of<IndexProductEntryBloc>(context)
        .state
        .productEntries!
        .productEntries;
    return ListView.builder(
      itemCount: productEntries.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            contentPadding: const EdgeInsets.all(8.0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VerifyProductEntryPage(productEntryId: productEntries[index].id!,),
                ),
              ).then((value) {
                context.read<IndexProductEntryBloc>().add(const ReloadEvent());
              });
            },
            trailing: productEntries[index].verified == true
                ? const Chip(
                    label: Text(
                      'Verificado',
                      style: TextStyle(fontSize: 10.0),
                    ),
                    backgroundColor: Colors.green,
                  )
                : const Chip(
                    label: Text(
                      'Pendiente',
                      style: TextStyle(fontSize: 10.0),
                    ),
                    backgroundColor: Colors.amberAccent,
                  ),
            title:
                Text('Producto: ${productEntries[index].product.modelProduct}'),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if (productEntries[index].entryOrder.verifiedEntryOrder !=
                        null)
                      productEntries[index].entryOrder.verifiedEntryOrder == true
                          ? const Icon(
                              Icons.check,
                              color: Colors.green,
                            )
                          : const Icon(
                              Icons.hourglass_bottom,
                              color: Colors.blueGrey,
                            ),
                    Text(
                      'Orden de Ingreso: ' +
                          productEntries[index].entryOrder.codeEntryOrder,
                    ),
                  ],
                ),
                Text(
                  'Cantidad: ' + productEntries[index].quantity.toString(),
                ),
                Text(
                  'Fecha de Ingreso: ' + DateFormat('EEEE d MMMM, ' 'yy - HH:mm a')
                      .format(DateTime.parse(productEntries[index].createdAt)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
