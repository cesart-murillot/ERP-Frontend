import 'package:erp_fronted/sale/generate_sale/generate_sale_view.dart';
import 'package:erp_fronted/sale/show_sale/show_sale_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'list_sale_bloc.dart';
import 'list_sale_event.dart';
import 'list_sale_state.dart';

class ListSalePage extends StatelessWidget {
  const ListSalePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ListSaleBloc()..add(const InitEvent()),
      child: Builder(
        builder: (context) => Scaffold(
          body: const StateView(),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(
                  context,
                    MaterialPageRoute(
                      builder: (_) => const GenerateSalePage(),
                    ),
                  ).then((value) => context.read<ListSaleBloc>().add(const ReloadListSalePageEvent()));
            },
            label: const Text('Vender'),
            icon: const Icon(Icons.point_of_sale),
          ),
        ),
      ),
    );
  }
}

class StateView extends StatelessWidget {
  const StateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListSaleBloc, ListSaleState>(
      builder: (context, state) {
        switch (state.state) {
          case States.initial:
            return const Center(
              child: Text('Initial State'),
            );
          case States.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case States.loaded:
            return const ListSales();
          case States.error:
            return Center(
              child: Text('${state.errorMessage}'),
            );
        }
        return const SizedBox();
      },
    );
  }
}

class ListSales extends StatelessWidget {
  const ListSales({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sales = context.read<ListSaleBloc>().state.sales;
    if (sales != null) {
      return ListView.builder(
        itemCount: sales.sales.length,
        itemBuilder: (context, index) {
          final sale = sales.sales[index];
          final dateSale = DateFormat('EEEE d MMMM, ' 'yy - HH:mm a')
              .format(DateTime.parse(sale.dateSale!));
          return ListTile(
            title: Text('Monto: ${sale.totalSale}'),
            subtitle: Text('Fecha: $dateSale'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ShowSalePage(
                    saleId: sale.id!,
                  ),
                ),
              );
            },
          );
        },
      );
    }
    return const SizedBox();
  }
}
