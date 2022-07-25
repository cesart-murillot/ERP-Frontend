import 'package:erp_fronted/search_bar/product_search/product_search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'generate_sale_bloc.dart';
import 'generate_sale_event.dart';
import 'generate_sale_state.dart';

class GenerateSalePage extends StatelessWidget {
  const GenerateSalePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => GenerateSaleBloc()..add(InitEvent()),
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
    return BlocBuilder<GenerateSaleBloc, GenerateSaleState>(
      builder: (context, state) {
        switch (state.state) {
          case States.initial:
            return const Center(
              child: Text(
                'Initial State',
              ),
            );
            break;
          case States.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
            break;
          case States.loaded:
            return const GenerateSale();
            break;
          case States.error:
            return Center(
              child: Text(
                state.errorMessage,
              ),
            );
            break;
        }
      },
    );
  }
}

class GenerateSale extends StatelessWidget {
  const GenerateSale({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Apellido o Razón Social'),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
              width: 8.0,
            ),
            Row(
              children: [
                Flexible(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('CI o NIT'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
              width: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => const ProductSearchPage(),
                    ).then(
                      (productId) {
                        if (productId != null && productId is int) {
                          context
                              .read<GenerateSaleBloc>()
                              .add(AddProductToSaleEvent(productId));
                        }
                      },
                    );
                  },
                  child: const Text(
                    'Añadir Producto',
                  ),
                ),
              ],
            ),
            const Divider(),
            const ProductDetail(),
            const Divider(),
          ],
        ),
      ),
    );
  }
}

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = context.watch<GenerateSaleBloc>().state.products;

    return FittedBox(
      child: DataTable(
        rows: List.generate(
          products.length,
          (index) {
            final product = products[index];
            return DataRow(
              cells: [
                DataCell(
                  Text(
                    '${(product.id ?? 0) * 1000}',
                  ),
                ),
                DataCell(
                  Text(
                    '${product.price}',
                  ),
                ),
                DataCell(
                  Text(
                    '${product.modelProduct} - ${product.formatProduct}',
                  ),
                ),
                DataCell(
                  Text(
                    '${product.id ?? 0 * 100}',
                  ),
                ),
                DataCell(
                  Text(
                    '${product.price}',
                  ),
                ),
              ],
            );
          },
        ),
        columns: [
          DataColumn(
            label: Wrap(
              children: const [Text('Codigo')],
            ),
          ),
          DataColumn(
            label: Wrap(
              children: const [Text('Cantidad')],
            ),
          ),
          DataColumn(
            label: Wrap(
              children: const [Text('Descripción')],
            ),
          ),
          DataColumn(
            label: Wrap(
              children: const [Text('Precio Unitario')],
            ),
          ),
          DataColumn(
            label: Wrap(
              children: const [Text('Sub Total')],
            ),
          )
        ],
      ),
    );
  }
}
