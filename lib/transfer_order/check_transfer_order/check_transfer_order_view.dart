import 'dart:html';

import 'package:built_collection/src/list.dart';
import 'package:erp_fronted/product_request/models/product_transfer_model.dart';
import 'package:erp_fronted/transfer_order/models/transfer_order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'check_transfer_order_bloc.dart';
import 'check_transfer_order_event.dart';
import 'check_transfer_order_state.dart';

class CheckTransferOrderPage extends StatelessWidget {
  const CheckTransferOrderPage({Key? key, required this.transferOrderId})
      : super(key: key);
  final int transferOrderId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          CheckTransferOrderBloc()..add(InitEvent(transferOrderId)),
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
    return BlocBuilder<CheckTransferOrderBloc, CheckTransferOrderState>(
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
            if (state.transferOrder != null) {
              return TransferOrderWidget(
                transferOrder: state.transferOrder!,
              );
            }
            return const Center(
              child: Text('An error has occurred'),
            );
          case States.reloading:
            return const Center(
              child: Text('Reloading state'),
            );
          case States.error:
            return Center(
              child: Text('${state.errorString}'),
            );
        }
      },
    );
  }
}

class TransferOrderWidget extends StatelessWidget {
  const TransferOrderWidget({Key? key, required this.transferOrder})
      : super(key: key);
  final TransferOrder transferOrder;

  @override
  Widget build(BuildContext context) {
    final requestDate = DateFormat('EEEE d MMMM, ' 'yy - HH:mm a')
        .format(DateTime.parse(transferOrder.transfer.createdAt!));
    final verifiedDate = DateFormat('EEEE d MMMM, ' 'yy - HH:mm a')
        .format(DateTime.parse(transferOrder.createdAt!));
    final branch =
        '${transferOrder.transfer.branch?.nameBranch} - ${transferOrder.transfer.branch?.addressBranch}';
    final employeeName =
        '${transferOrder.transfer.user?.employee?.namesEmployee} ${transferOrder.transfer.user?.employee?.lastNameEmployee}';
    final userRole = '${transferOrder.transfer.user?.role?.nameRole}';
    final userContact = '${transferOrder.transfer.user?.email}';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Card(
          margin: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Solicitado por $employeeName - $userRole'),
                Text(userContact),
                Text(branch),
                Text(requestDate),
              ],
            ),
          ),
        ),
        Text('Aprobado $verifiedDate'),
        Flexible(
          child: ProductTransferList(
              productTransfer: transferOrder.transfer.productTransfers),
        ),
        TransferControl(sent: transferOrder.sent, received: transferOrder.received),
      ],
    );
  }
}

class ProductTransferList extends StatelessWidget {
  const ProductTransferList({Key? key, required this.productTransfer})
      : super(key: key);
  final BuiltList<ProductTransfer> productTransfer;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productTransfer.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final modelProduct = '${productTransfer[index].product?.modelProduct}';
        final formatProduct =
            '${productTransfer[index].product?.formatProduct}';
        final quantity = productTransfer[index].quantity;
        return ListTile(
          title: Text(modelProduct),
          subtitle: Text(formatProduct),
          leading: Text(quantity.toString()),
        );
      },
    );
  }
}

class TransferControl extends StatelessWidget {
  const TransferControl({Key? key, required this.sent, required this.received}) : super(key: key);
  final bool sent, received;
  @override
  Widget build(BuildContext context) {
    if(!sent && !received) {
      return ElevatedButton(onPressed: () {}, child: const Text('Marcar como Enviado'),);
    }
    if(sent && !received) {
      return ElevatedButton(onPressed: () {}, child: const Text('Marcar como Recibido'),);
    }
    return const Text('Error');
  }
}


