import 'package:erp_fronted/quotation/generate_quotation/generate_quotation_view.dart';
import 'package:erp_fronted/quotation/show_quotation/show_quotation_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'list_quotation_bloc.dart';
import 'list_quotation_event.dart';
import 'list_quotation_state.dart';

class ListQuotationPage extends StatelessWidget {
  const ListQuotationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ListQuotationBloc()..add(InitEvent()),
      child: Builder(
        builder: (context) => Scaffold(
          body: const StateViews(),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(
                  context,
                    MaterialPageRoute(
                      builder: (_) => const GenerateQuotationPage(),
                    ),
                  );
            },
            label: const Text(
              'Generar Cotización',
            ),
          ),
        ),
      ),
    );
  }
}

class StateViews extends StatelessWidget {
  const StateViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListQuotationBloc, ListQuotationState>(
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
            return const QuotationTable();
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

class ListQuotation extends StatelessWidget {
  const ListQuotation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quotations =
        context.read<ListQuotationBloc>().state.quotations?.quotations;

    if (quotations != null) {
      return ListView.builder(
        itemCount: quotations.length,
        itemBuilder: (context, index) {
          final quotation = quotations[index];
          final dateQuotation = DateFormat('EEEE d MMMM, ' 'yy - HH:mm a')
              .format(DateTime.parse(quotation.dateQuotation));
          return Card(
            child: ListTile(
              title: Text(
                'Razón Social: ${quotation.nameQuotation}',
              ),
              subtitle: Text(
                'Fecha de cotización: $dateQuotation',
              ),
              onTap: () {
                if (quotation.id != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ShowQuotationPage(
                        quotationId: quotation.id!,
                      ),
                    ),
                  );
                }
              },
            ),
          );
        },
      );
    }
    return const SizedBox();
  }
}

class QuotationTable extends StatelessWidget {
  const QuotationTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quotations =
        context.read<ListQuotationBloc>().state.quotations?.quotations;
    if (quotations != null) {
      return SingleChildScrollView(
        child: Center(
          child: DataTable(
            showBottomBorder: true,
            showCheckboxColumn: false,
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  'Fecha',
                ),
              ),
              DataColumn(
                label: Text(
                  'Cliente',
                ),
              ),
              DataColumn(
                numeric: true,
                label: Text(
                  'Monto',
                ),
              ),
            ],
            rows: List.generate(
              quotations.length,
              (index) {
                final quotation = quotations[index];
                final dateQuotation = DateFormat('EEEE d MMMM, ' 'yy')
                    .format(DateTime.parse(quotation.dateQuotation));
                return DataRow(
                  onSelectChanged: (value) {
                    if (quotation.id != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              ShowQuotationPage(quotationId: quotation.id!),
                        ),
                      );
                    }
                  },
                  cells: <DataCell>[
                    DataCell(
                      Text(
                        dateQuotation,
                      ),
                    ),
                    DataCell(
                      Text(
                        quotation.nameQuotation,
                      ),
                    ),
                    DataCell(
                      Text(
                        '${quotation.priceQuotation}',
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      );
    }
    return Container();
  }
}
