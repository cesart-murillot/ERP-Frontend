import 'package:flutter/material.dart';
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
        BlocProvider(create: (_) => GenerateQuotationBloc()),
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
    return BlocBuilder<GenerateQuotationBloc, GenerateQuotationState>(
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
                const Flexible(
                  flex: 2,
                  child: SizedBox(),
                ),
                Flexible(
                  flex: 1,
                  child: TextButton(
                    onPressed: () {
                      /*context
                          .read<GenerateQuotationBloc>()
                          .add(AddProductQuotationEvent());*/
                      showSearch(
                        context: context,
                        delegate: ProductSearch(),
                      );
                    },
                    child: const Text('Añadir Producto'),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Remover Producto'),
                  ),
                )
              ],
            ),
            const ProductDetail(),
          ],
        ),
      ),
    );
  }
}

class ProductSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      Icon(Icons.clear),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Icon(Icons.clear);
  }

  @override
  Widget buildResults(BuildContext context) {
    return Icon(Icons.clear);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Icon(Icons.clear);
  }
}

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final products = context.watch<GenerateQuotationBloc>().state.products;
    final products = context.watch<GenerateQuotationBloc>().state.list;
    return DataTable(
      showBottomBorder: true,
      showCheckboxColumn: false,
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            'Codigo',
          ),
        ),
        DataColumn(
          label: Text(
            'Detalle del Producto',
          ),
        ),
        DataColumn(
          label: Text(
            'Precio unitario',
          ),
        ),
        DataColumn(
          label: Text(
            'Cantidad',
          ),
        ),
        DataColumn(
          label: Text(
            'Sub Total',
          ),
        ),
      ],
      rows: List.generate(
        products.length,
        (index) {
          return const DataRow(
            cells: <DataCell>[
              DataCell(
                Text(
                  'Code',
                ),
              ),
              DataCell(
                Text(
                  'Detail',
                ),
              ),
              DataCell(
                Text(
                  'Unit price',
                ),
              ),
              DataCell(
                Text(
                  'Quantity',
                ),
              ),
              DataCell(
                Text(
                  'Sub total',
                ),
              ),
            ],
          );
        },
      ),
    );
    return const SizedBox();
  }
}

class Example extends StatelessWidget {
  const Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = context.watch<GenerateQuotationBloc>().state.list;
    print(products.length);
    return ListView.builder(
      shrinkWrap: true,
      itemCount: products.length,
      itemBuilder: (context, index) {
        return FlutterLogo();
      },
    );
  }
}
