import 'package:erp_fronted/transfer_order/check_transfer_order/check_transfer_order_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'product_shipment_bloc.dart';
import 'product_shipment_event.dart';
import 'product_shipment_state.dart';

class ProductShipmentPage extends StatelessWidget {
  const ProductShipmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ProductShipmentBloc()..add(InitEvent()),
      child: Builder(
        builder: (context) => const StateViews(),
      ),
    );
  }
}

class StateViews extends StatelessWidget {
  const StateViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductShipmentBloc, ProductShipmentState>(
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
            return const ProductShipment();
            break;
          case States.error:
            return Center(
              child: Text(
                '${state.errorMessage}',
              ),
            );
            break;
        }
      },
    );
  }
}

class ProductShipment extends StatelessWidget {
  const ProductShipment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final transferOrderList =
        context.read<ProductShipmentBloc>().state.transferOrders;
    if (transferOrderList != null) {
      final transferOrders = transferOrderList.transferOrders;
      return ListView.builder(
        itemCount: transferOrders.length,
        itemBuilder: (context, index) {
          final transferOrder = transferOrders[index];
          final date = DateFormat('EEEE d MMMM, ' 'yy - HH:mm a')
              .format(DateTime.parse(transferOrder.createdAt!));
          final bool sent = transferOrder.sent;
          final bool received = transferOrder.received;
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                        MaterialPageRoute(
                          builder: (_) => CheckTransferOrderPage(transferOrderId: transferOrder.id),
                        ),
                      ).then((value) => context.read<ProductShipmentBloc>().add(const InitEvent()));
                },
                title: Text(
                  '${transferOrder.transfer.branch?.typeBranch} - ${transferOrder.transfer.branch?.nameBranch}',
                ),
                subtitle: Text(
                  'Fecha de Solicitud $date',
                ),
                trailing: !sent && !received
                    ? Chip(
                        backgroundColor: Colors.transparent,
                        avatar: const Icon(
                          Icons.label_important,
                          color: Colors.yellowAccent,
                        ),
                        label: Text(
                          'No Enviado',
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                      )
                    : sent && !received
                        ? Column(
                            children: [
                              SizedBox(
                                height: 24.0,
                                child: FittedBox(
                                  child: Chip(
                                    backgroundColor: Colors.transparent,
                                    avatar: const Icon(
                                      Icons.send_time_extension,
                                      color: Colors.greenAccent,
                                    ),
                                    label: Text(
                                      'Enviado',
                                      style: GoogleFonts.roboto(
                                        textStyle:
                                            Theme.of(context).textTheme.labelMedium,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 24.0,
                                child: FittedBox(
                                  child: Chip(
                                    backgroundColor: Colors.transparent,
                                    avatar: const Icon(
                                      Icons.label,
                                      color: Colors.yellowAccent,
                                    ),
                                    label: Text(
                                      'No recibido',
                                      style: GoogleFonts.roboto(
                                        textStyle:
                                            Theme.of(context).textTheme.labelMedium,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Chip(
                            backgroundColor: Colors.transparent,
                            avatar: const Icon(
                              Icons.bookmark_added,
                              color: Colors.greenAccent,
                            ),
                            label: Text(
                              'Traspaso Completado',
                              style: GoogleFonts.roboto(
                                textStyle:
                                    Theme.of(context).textTheme.labelMedium,
                              ),
                            ),
                          ),
              ),
            ),
          );
        },
      );
    }
    return const SizedBox();
  }
}
