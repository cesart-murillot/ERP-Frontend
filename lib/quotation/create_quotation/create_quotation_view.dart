import 'package:erp_fronted/search_bar/product_search/product_search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'create_quotation_bloc.dart';
import 'create_quotation_event.dart';
import 'create_quotation_state.dart';

class CreateQuotationPage extends StatelessWidget {
  const CreateQuotationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          CreateQuotationBloc()..add(const InitEvent()),
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
    return BlocBuilder<CreateQuotationBloc, CreateQuotationState>(
      builder: (context, state) {
        switch (state.state) {
          case States.initial:
            return const Center(
              child: CreateQuotation(),
            );
            break;
          case States.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
            break;
          case States.loaded:
            return const CreateQuotation();
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

class CreateQuotation extends StatelessWidget {
  const CreateQuotation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QuotationDataTable();
  }
}

class QuotationDataTable extends StatelessWidget {
  QuotationDataTable({Key? key}) : super(key: key);
  final List<TextEditingController> prices = [];
  @override
  Widget build(BuildContext context) {
    final quotationData =
        context.watch<CreateQuotationBloc>().state.quotationData;
    return Column(
      children: [
        FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => const ProductSearchPage(),
            ).then(
              (productId) {
                if (productId != null && productId is int) {
                  final TextEditingController controller = TextEditingController();
                  prices.add(controller);
                  print(prices.length);
                  context.read<CreateQuotationBloc>().add(AddProductQuotationEvent(productId));
                }
              },
            );
          },
        ),
        FittedBox(
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
              quotationData.length,
              (index) {
                final productName = quotationData[index]['productName'];
                final price = quotationData[index]['price'];
                final quantity = quotationData[index]['quantity'];
                final subTotal = quotationData[index]['subTotal'];
                final controller = prices[index];
                return DataRow(
                  cells: <DataCell>[
                    DataCell(
                      Text(
                        productName,
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
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                    DataCell(
                      TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                    const DataCell(
                      Text(
                        'text',
                      ),
                    ),
                    DataCell(
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {},
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

