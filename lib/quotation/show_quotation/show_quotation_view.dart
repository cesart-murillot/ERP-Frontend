import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'show_quotation_bloc.dart';
import 'show_quotation_event.dart';
import 'show_quotation_state.dart';

class ShowQuotationPage extends StatelessWidget {
  const ShowQuotationPage({Key? key, required this.quotationId})
      : super(key: key);
  final int quotationId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          ShowQuotationBloc()..add(InitEvent(quotationId)),
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
    return BlocBuilder<ShowQuotationBloc, ShowQuotationState>(
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
            return const ShowQuotation();
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

class ShowQuotation extends StatelessWidget {
  const ShowQuotation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quotation = context.read<ShowQuotationBloc>().state.quotation;
    if (quotation != null) {
      final quotationDate = DateFormat('EEEE d MMMM, ' 'yy - HH:mm a')
          .format(DateTime.parse(quotation.dateQuotation));
      final expirationDate = DateFormat('EEEE d MMMM, ' 'yy')
          .format(DateTime.parse(quotation.expirationDate));
      return Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Fecha de cotización: $quotationDate',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    children: [
                      Text(
                        'Fecha de Expiración: $expirationDate',
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    children: [
                      Text(
                        'Razón Social: ${quotation.nameQuotation}',
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    children: [
                      Text(
                        'Total Cotizado: ${quotation.priceQuotation}',
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: quotation.productQuotations.length,
            itemBuilder: (context, index) {
              final productQuotation = quotation.productQuotations[index];
              return Card(
                child: ListTile(
                  isThreeLine: true,
                  title: Text(
                    '${productQuotation.product?.modelProduct} - ${productQuotation.product?.formatProduct}',
                  ),
                  subtitle: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Cantidad: ${productQuotation.quantity}',
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            'Precio Unitario: ${productQuotation.unitPrice}',
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            'Precio Total: ${productQuotation.totalPrice}',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      );
    }
    return Container();
  }
}
