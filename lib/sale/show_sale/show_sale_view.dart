import 'package:erp_fronted/sale/show_sale/show_sale_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'show_sale_bloc.dart';
import 'show_sale_event.dart';

class ShowSalePage extends StatelessWidget {
  const ShowSalePage({Key? key, required this.saleId}) : super(key: key);
  final int saleId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShowSaleBloc()..add(InitEvent(saleId)),
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
    return BlocBuilder<ShowSaleBloc, ShowSaleState>(
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
            return const ShowSale();
          case States.error:
            return Center(
              child: Text(
                '${state.errorMessage}',
              ),
            );
        }
        return const SizedBox();
      },
    );
  }
}

class ShowSale extends StatelessWidget {
  const ShowSale({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sale = context.read<ShowSaleBloc>().state.sale;
    if (sale != null) {
      final saleDate = DateFormat('EEEE d MMMM, ' 'yy - HH:mm a')
          .format(DateTime.parse(sale.dateSale!));
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text('Fecha: $saleDate'),
              ],
            ),
          ),
          ListView.builder(
            itemCount: sale.productSales!.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final productSale = sale.productSales![index];
              return ListTile(
                trailing: Text('Sub Total: ${productSale.totalPrice}'),
                title: Text(
                  '${productSale.product?.modelProduct}',
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Precio Unitario: ${productSale.unitPrice}',
                    ),
                    Text(
                      'Cantidad: ${productSale.quantity}',
                    ),
                  ],
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Total: ${sale.totalSale}',
                ),
              ],
            ),
          ),
        ],
      );
    }
    return const SizedBox();
  }
}
