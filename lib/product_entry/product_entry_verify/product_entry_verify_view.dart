import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_entry_verify_bloc.dart';
import 'product_entry_verify_event.dart';
import 'product_entry_verify_state.dart';

class ProductEntryVerifyPage extends StatelessWidget {
  final int productEntryId;

  const ProductEntryVerifyPage({Key? key, required this.productEntryId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      ProductEntryVerifyBloc()
        ..add(
          GetProductEntryEvent(productEntryId),
        ),
      child: Builder(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    BlocProvider.of<ProductEntryVerifyBloc>(context)
                        .add(const VerifyProductEntry());
                  },
                  icon: const Icon(Icons.verified),
                )
              ],
            ),
            body: const ProductEntry(),
          );
        },
      ),
    );
  }
}

class ProductEntry extends StatelessWidget {
  const ProductEntry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductEntryVerifyBloc, ProductEntryVerifyState>(
      buildWhen: (prevState, state) {
        if (state is LoadedProductEntryState) {
          return true;
        }
        return false;
      },
      listener: (context, state) {
        if (state is ShowVerifyDialogState) {
          showDialog(
            context: context,
            builder: (_) =>
                BlocProvider.value(
                  value: BlocProvider.of<ProductEntryVerifyBloc>(context),
                  child: const VerificationDialog(),
                ),
          );
        }
      },
      builder: (context, state) {
        if (state is LoadedProductEntryState) {
          return Card(
            semanticContainer: false,
            margin: const EdgeInsets.all(16.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        state.productEntry.product.modelProduct,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      Transform.scale(
                        scale: 0.5,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.open_in_new),
                        ),
                      )
                    ],
                  ),
                  Text(
                    'Acabado: ' + state.productEntry.product.formatProduct!,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  Container(
                    height: 8.0,
                  ),
                  Text(
                    'Cantidad: ' + state.productEntry.quantity.toString(),
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  Flexible(
                    child: Align(
                      alignment: Alignment.center,
                      child: Image.network(
                          'https://i.picsum.photos/id/231/200/300.jpg?hmac=n_7Og264LcJKH8Pq2zs5UWIgqEwwgx4pTuhRUEOWWpg'),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Orden de Ingreso: ' +
                            state.productEntry.entryOrder.codeEntryOrder,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      Transform.scale(
                        scale: 0.5,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.open_in_new),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Fecha de Ingreso: ' +
                        state.productEntry.entryOrder.createdAt!,
                    style: const TextStyle(fontSize: 14.0),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      child: const Text('Reportar Merma'),
                      onPressed: () {},
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      child: const Text('Reportar Error'),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          );
        }
        return const Center(child: CircularProgressIndicator(),);
      },
    );
  }
}

class VerificationDialog extends StatelessWidget {
  const VerificationDialog({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return BlocBuilder<ProductEntryVerifyBloc, ProductEntryVerifyState>(
      builder: (context, state) {
        return AlertDialog(
          title: const Text('Verificar Entrada de Productos'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'Cancelar');
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                BlocProvider.of<ProductEntryVerifyBloc>(context)
                    .add(const ConfirmProductEntryEvent());
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}
