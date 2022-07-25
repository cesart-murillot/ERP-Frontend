import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:erp_fronted/quotation/generate_quotation/generate_quotation_event.dart';
import 'package:erp_fronted/search_bar/product_search/product_search_view.dart';
import 'package:erp_fronted/src/resources/get_object.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'generate_quotation_bloc.dart';
import 'generate_quotation_state.dart';

class GenerateQuotationPage extends StatelessWidget {
  const GenerateQuotationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GenerateQuotationBloc()..add(InitEvent())),
      ],
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
    return BlocConsumer<GenerateQuotationBloc, GenerateQuotationState>(
      listener: (context, state) async {
        if (state.quotationId != 0) {
          final url = preDefinedUri('/api/example/${state.quotationId}');

          try {
            PDFDocument doc = await PDFDocument.fromURL(url.toString());
          } catch (e) {
            print(e);
          }
        }
      },
      builder: (context, state) {
        return const GenerateQuotation();
      },
    );
  }
}

class GenerateQuotation extends StatelessWidget {
  const GenerateQuotation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final total = context.watch<GenerateQuotationBloc>().state.total;
    final length = context.watch<GenerateQuotationBloc>().state.products.length;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Informacion del Cliente: ',
              style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Apellido o Razon Social',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              'Detalle de Productos: ',
              style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    /*context
                        .read<GenerateQuotationBloc>()
                        .add(AddProductQuotationEvent());*/
                    showDialog(
                      context: context,
                      builder: (_) => const ProductSearchPage(),
                    ).then(
                      (productId) {
                        if (productId != null && productId is int) {
                          context
                              .read<GenerateQuotationBloc>()
                              .add(AddProductQuotationEvent(productId));
                        }
                      },
                    );
                  },
                  child: const Text('Añadir Producto'),
                ),
              ],
            ),
            const Center(
              child: ProductDetail(),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Total: $total'),
              ],
            ),
            const SizedBox(
              height: 8.0,
              width: 8.0,
            ),
            length > 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FloatingActionButton.extended(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) => BlocProvider.value(
                              value: BlocProvider.of<GenerateQuotationBloc>(
                                  context),
                              child: const ConfirmationDialog(),
                            ),
                          );
                        },
                        label: const Text(
                          'Registrar',
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),
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
    //final products = context.watch<GenerateQuotationBloc>().state.products;
    final products = context.watch<GenerateQuotationBloc>().state.products;
    final prices = context.watch<GenerateQuotationBloc>().state.prices;
    final quantities = context.watch<GenerateQuotationBloc>().state.quantities;
    final subTotals = context.watch<GenerateQuotationBloc>().state.subTotals;

    return FittedBox(
      child: DataTable(
        columnSpacing: 16.0,
        columns: <DataColumn>[
          DataColumn(
            label: Wrap(
              children: const [Text('Detalle')],
            ),
          ),
          DataColumn(
            label: Wrap(
              children: const [
                Text(
                  'Precio\nunitario',
                ),
              ],
            ),
          ),
          DataColumn(
            label: Wrap(
              children: const [
                Text(
                  'Cantidad',
                ),
              ],
            ),
          ),
          DataColumn(
            label: Wrap(
              children: const [
                Text(
                  'Sub Total',
                ),
              ],
            ),
          ),
          DataColumn(
            label: Wrap(
              children: const [
                Text(
                  '',
                ),
              ],
            ),
          )
        ],
        rows: List.generate(
          products.length,
          (index) {
            final product = products[index];
            final price = prices[index];
            final quantity = quantities[index];
            final subTotal = subTotals[index];
            return DataRow(
              cells: <DataCell>[
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
                    controller: price,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      context
                          .read<GenerateQuotationBloc>()
                          .add(QuantityPriceChangeEvent(index));
                    },
                  ),
                ),
                DataCell(
                  TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    controller: quantity,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      context
                          .read<GenerateQuotationBloc>()
                          .add(QuantityPriceChangeEvent(index));
                    },
                  ),
                ),
                DataCell(
                  Text(
                    '$subTotal',
                  ),
                ),
                DataCell(
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      context
                          .read<GenerateQuotationBloc>()
                          .add(RemoveProductQuotationEvent(index));
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
    return const SizedBox();
  }
}

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenerateQuotationBloc, GenerateQuotationState>(
      builder: (context, state) {
        return AlertDialog(
          title: const Text('Generar Cotización'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                context.read<GenerateQuotationBloc>().add(SaveQuotationEvent());

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
