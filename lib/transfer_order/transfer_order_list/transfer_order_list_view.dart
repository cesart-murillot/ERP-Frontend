import 'package:erp_fronted/transfer_order/check_transfer_order/check_transfer_order_view.dart'
    as check_transfer_order;
import 'package:erp_fronted/transfer_order/models/transfer_order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'transfer_order_list_bloc.dart';
import 'transfer_order_list_event.dart';
import 'transfer_order_list_state.dart';

class TransferOrderListPage extends StatelessWidget {
  const TransferOrderListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          TransferOrderListBloc()..add(InitEvent()),
      child: Builder(
        builder: (context) => const StateView(),
      ),
    );
  }
}

class StateView extends StatelessWidget {
  const StateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransferOrderListBloc, TransferOrderListState>(
      builder: (context, state) {
        switch (state.state) {
          case States.initial:
            return const Center(
              child: Text('initial State'),
            );
          case States.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case States.loaded:
            if (state.transferOrders != null) {
              return TransferOrderList(
                transferOrders: state.transferOrders!,
              );
            }
            return const Center(
              child: Text('Error'),
            );

          case States.reload:
            return const Center(
              child: Text('Reloading'),
            );
          case States.error:
            return Center(
              child: Text('${state.errorString}'),
            );
          default:
            return const Center(
              child: Text('An Error has Occurred'),
            );
            break;
        }
      },
    );
  }
}

class TransferOrderList extends StatelessWidget {
  const TransferOrderList({Key? key, required this.transferOrders})
      : super(key: key);
  final TransferOrders transferOrders;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: transferOrders.transferOrders.length,
      itemBuilder: (context, index) {
        return TransferOrderTile(
            transferOrder: transferOrders.transferOrders[index]);
      },
    );
  }
}

class TransferOrderTile extends StatelessWidget {
  const TransferOrderTile({Key? key, required this.transferOrder})
      : super(key: key);
  final TransferOrder transferOrder;

  @override
  Widget build(BuildContext context) {
    final createdDate = DateFormat('EEEE d MMMM, ' 'yy - HH:mm a')
        .format(DateTime.parse(transferOrder.createdAt!));
    final String branchName = '${transferOrder.transfer.branch?.nameBranch}';
    final String completeName =
        '${transferOrder.transfer.user?.employee?.namesEmployee} ${transferOrder.transfer.user?.employee?.lastNameEmployee}';
    final String branchAddress =
        '${transferOrder.transfer.branch?.addressBranch}';
    return Card(
      child: ListTile(
        isThreeLine: true,
        title: Text('$branchName - $completeName'),
        subtitle: Wrap(
          children: [
            Text(branchAddress),
            const SizedBox(
              height: 16.0,
              width: 16.0,
            ),
            Text(createdDate),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => check_transfer_order.CheckTransferOrderPage(
                transferOrderId: transferOrder.id,
              ),
            ),
          );
        },
        trailing: SentReceived(
          sent: transferOrder.sent,
          received: transferOrder.received,
        ),
      ),
    );
  }
}

class SentReceived extends StatelessWidget {
  const SentReceived({Key? key, required this.sent, required this.received})
      : super(key: key);
  final bool sent, received;

  @override
  Widget build(BuildContext context) {
    if (!sent && !received) {
      return const Chip(label: Text('Pendiente'));
    }
    if (sent && !received) {
      return Wrap(
        children: const [
          Chip(
            label: Text('Enviado'),
          ),
          Chip(
            label: Text('No recibido'),
          ),
        ],
      );
    }
    if (sent && received) {
      return const Chip(
        label: Text('Envio Completado'),
      );
    }
    return const Chip(
      label: Text('Error'),
    );
  }
}
