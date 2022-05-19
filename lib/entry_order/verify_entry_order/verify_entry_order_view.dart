import 'package:erp_fronted/entry_order/models/entry_order_model.dart';
import 'package:erp_fronted/src/resources/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'verify_entry_order_bloc.dart';
import 'verify_entry_order_event.dart';
import 'verify_entry_order_state.dart';

class VerifyEntryOrderPage extends StatelessWidget {
  const VerifyEntryOrderPage({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            VerifyEntryOrderBloc(Repository())..add(GetEntryOrderEvent(id)),
        child: Scaffold(
          appBar: AppBar(),
          body: const EntryOrderHold(),
        ));
  }
}

class EntryOrderHold extends StatelessWidget {
  const EntryOrderHold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerifyEntryOrderBloc, VerifyEntryOrderState>(
      builder: (context, state) {
        if (state is LoadedEntryOrder) {
          return Card(
              margin: const EdgeInsets.all(24.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: EntryOrderInformation(entryOrder: state.entryOrder),
              ));
        }
        return const Text('error');
      },
    );
  }
}

class EntryOrderInformation extends StatelessWidget {
  const EntryOrderInformation({Key? key, required this.entryOrder})
      : super(key: key);
  final EntryOrder entryOrder;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Row(
          children: [
            const Text('Código de Ingreso: ', style: TextStyle(fontSize: 18.0), ),
            Text(entryOrder.codeEntryOrder, style: const TextStyle(fontSize: 18.0),),
          ],
        ),
        Row(
          children: [
            const Text('Fecha de Ingreso: ', style: TextStyle(fontSize: 18.0),),
            Expanded(child: Text(entryOrder.createdAt!, style: const TextStyle(fontSize: 12.0),)),
          ],
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: entryOrder.entryOrderProduct!.length,
          itemBuilder: (context, index) {
            return ListTile(
                title: Text(
                  entryOrder.entryOrderProduct![index].product!.modelProduct,
                    style: const TextStyle(fontSize: 16.0)
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text('Formato: ', style: TextStyle(fontSize: 16.0)),
                            Text(
                              entryOrder.entryOrderProduct![index].product!
                                  .formatProduct!,
                                style: const TextStyle(fontSize: 16.0),
                            )
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            const Text('Cantidad: ', style: TextStyle(fontSize: 16.0),),
                            Text(
                              entryOrder.entryOrderProduct![index].quantity
                                  .toString(),
                              style: const TextStyle(fontSize: 16.0),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ));
          },
        ),
      ],
    );
  }
}
