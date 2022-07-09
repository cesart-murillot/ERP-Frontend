import 'package:erp_fronted/inventory/product_transfer_detail/product_transfer_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'product_transfer_bloc.dart';
import 'product_transfer_event.dart';
import 'product_transfer_state.dart';

class ProductTransferPage extends StatelessWidget {
  const ProductTransferPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ProductTransferBloc()..add(InitEvent()),
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
    return BlocBuilder<ProductTransferBloc, ProductTransferState>(
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
            return const ProductTransfer();
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

class ProductTransfer extends StatelessWidget {
  const ProductTransfer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final transferList = context.read<ProductTransferBloc>().state.transfers;
    if (transferList != null) {
      final transfers = transferList.transfers;
      return ListView.builder(
        itemCount: transfers.length,
        itemBuilder: (context, index) {
          final transfer = transfers[index];
          final createdDate = DateFormat('EEEE d MMMM, ' 'yy - HH:mm a')
              .format(DateTime.parse(transfer.createdAt!));
          final verified = transfer.verified ?? false;
          return Card(
            margin: const EdgeInsets.all(
              8.0,
            ),
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductTransferDetailPage(
                      transferId: transfer.id!,
                    ),
                  ),
                );
              },
              title: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        '${transfer.branch?.typeBranch} - ${transfer.branch?.nameBranch}',
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '${transfer.user?.employee?.namesEmployee} ${transfer.user?.employee?.lastNameEmployee}',
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('${transfer.user?.role?.nameRole}'),
                    ],
                  )
                ],
              ),
              subtitle: Column(
                children: [
                  Row(
                    children: [
                      Text(createdDate),
                    ],
                  )
                ],
              ),
              trailing: verified
                  ? const Chip(
                      label: Text('Verificado'),
                      backgroundColor: Colors.green,
                    )
                  : const Chip(
                      label: Text('Pendiente'),
                      backgroundColor: Colors.yellow,
                    ),
            ),
          );
        },
      );
    }
    return Container();
  }
}
