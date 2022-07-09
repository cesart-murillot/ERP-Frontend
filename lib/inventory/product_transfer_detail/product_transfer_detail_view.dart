import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'product_transfer_detail_bloc.dart';
import 'product_transfer_detail_event.dart';
import 'product_transfer_detail_state.dart';

class ProductTransferDetailPage extends StatelessWidget {
  const ProductTransferDetailPage({Key? key, required this.transferId})
      : super(key: key);
  final int transferId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          ProductTransferDetailBloc()..add(InitEvent(transferId)),
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
    return BlocBuilder<ProductTransferDetailBloc, ProductTransferDetailState>(
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
            return const ProductTransferDetail();
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

class ProductTransferDetail extends StatelessWidget {
  const ProductTransferDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final transfer = context.read<ProductTransferDetailBloc>().state.transfer;
    if (transfer != null) {
      final date = DateFormat('EEEE d MMMM, ' 'yy - HH:mm a')
          .format(DateTime.parse(transfer.createdAt!));
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Fecha de Solicitud: $date',
                ),
              ),
            ],
          ),
          const UserInfo(),
          const BranchInfo(),
          const ProductTransferInformation(),
        ],
      );
    }
    return Container();
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.read<ProductTransferDetailBloc>().state.transfer?.user;
    if (user != null) {
      return Card(
        margin: const EdgeInsets.all(
          8.0,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    '${user.employee?.namesEmployee} - ${user.employee?.lastNameEmployee}',
                  ),
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                children: [
                  Text(
                    '${user.role?.nameRole}',
                  ),
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                children: [
                  Text(
                    'Contacto: ${user.email}',
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
    return const SizedBox();
  }
}

class BranchInfo extends StatelessWidget {
  const BranchInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final branch =
        context.read<ProductTransferDetailBloc>().state.transfer?.branch;
    if (branch != null) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    '${branch.typeBranch} - ${branch.nameBranch}',
                  ),
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                children: [
                  Text(
                    '${branch.addressBranch}',
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
    return Container();
  }
}

class ProductTransferInformation extends StatelessWidget {
  const ProductTransferInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productTransfers = context
        .read<ProductTransferDetailBloc>()
        .state
        .transfer
        ?.productTransfers;
    if (productTransfers != null) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: productTransfers.length,
        itemBuilder: (context, index) {
          final productTransfer = productTransfers[index];
          return Card(
            child: ListTile(
              title: Text(
                'Modelo: ${productTransfer.product!.modelProduct}',
              ),
              subtitle: Text(
                'Formato: ${productTransfer.product!.formatProduct}',
              ),
              trailing: ActionChip(
                label: Text(
                  'Cantidad: ${productTransfer.quantity}',
                ),
                onPressed: () {},
              ),
            ),
          );
        },
      );
    }
    return Container();
  }
}
