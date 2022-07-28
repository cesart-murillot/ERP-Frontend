import 'package:erp_fronted/search_bar/product_search/product_search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'generate_sale_bloc.dart';
import 'generate_sale_event.dart';
import 'generate_sale_state.dart';

class GenerateSalePage extends StatelessWidget {
  const GenerateSalePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          GenerateSaleBloc()..add(const InitEvent()),
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
          case States.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case States.loaded:
            return const GenerateSale();
          case States.error:
            return Center(
              child: Text(
                state.errorMessage,
              ),
            );
        }
      },
    );
  }
}

class GenerateSale extends StatelessWidget {
  const GenerateSale({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name = context.watch<GenerateSaleBloc>().state.name;
    final ci = context.watch<GenerateSaleBloc>().state.ci;
    final products = context.watch<GenerateSaleBloc>().state.products.length;
    final total = context.watch<GenerateSaleBloc>().state.total;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  child: TextFormField(
                    initialValue: name,
                    onChanged: (name) {
                      context
                          .read<GenerateSaleBloc>()
                          .add(NameChangedEvent(name));
                    },
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
                    initialValue: ci,
                    onChanged: (ci) {
                      context.read<GenerateSaleBloc>().add(CiChangedEvent(ci));
                    },
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
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Total: $total'),
                ],
              ),
            ),
            const Divider(),
            const SizedBox(
              height: 8.0,
              width: 8.0,
            ),
            products > 0 && name != '' && ci != ''
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FloatingActionButton.extended(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (_) => BlocProvider.value(
                                value: BlocProvider.of<GenerateSaleBloc>(
                                    context),
                                child: const ConfirmationDialog(),
                              ),
                          );
                        },
                        label: const Text(
                          'Facturar',
                        ),
                      )
                    ],
                  )
                : const SizedBox(
                    height: 8.0,
                    width: 8.0,
                  ),
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
    final prices = context.watch<GenerateSaleBloc>().state.prices;
    final quantities = context.watch<GenerateSaleBloc>().state.quantities;
    final subTotals = context.watch<GenerateSaleBloc>().state.subTotals;
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
                  TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    controller: quantities[index],
                    decoration: const InputDecoration(border: InputBorder.none),
                    onChanged: (value) {
                      context
                          .read<GenerateSaleBloc>()
                          .add(QuantityPriceChangeEvent(index));
                    },
                  ),
                ),
                DataCell(
                  Text(
                    '${product.modelProduct} - ${product.formatProduct}',
                  ),
                ),
                DataCell(
                  TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'^\d+\.?\d{0,2}'),
                      ),
                      //FilteringTextInputFormatter.digitsOnly,
                    ],
                    controller: prices[index],
                    decoration: const InputDecoration(border: InputBorder.none),
                    onChanged: (value) {
                      context
                          .read<GenerateSaleBloc>()
                          .add(QuantityPriceChangeEvent(index));
                    },
                  ),
                ),
                DataCell(
                  Text(
                    '${subTotals[index]}',
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

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenerateSaleBloc, GenerateSaleState>(
      builder: (context, state) {
        return AlertDialog(
          title: const Text('Facturar'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                context.read<GenerateSaleBloc>().add(const SaveSaleEvent());
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}