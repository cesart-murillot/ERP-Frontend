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
          case States.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case States.loaded:
            return const ProductTransferDetail();
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

class ProductTransferDetail extends StatelessWidget {
  const ProductTransferDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final transfer = context.read<ProductTransferDetailBloc>().state.transfer;
    if (transfer != null) {
      final date = DateFormat('EEEE d MMMM, ' 'yy - HH:mm a')
          .format(DateTime.parse(transfer.createdAt!));
      final verified = transfer.verified ?? false;
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
          const SizedBox(
            height: 8.0,
          ),
          !verified
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FloatingActionButton.extended(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) => BlocProvider.value(
                              value: BlocProvider.of<ProductTransferDetailBloc>(
                                  context),
                              child: const VerificationDialog(),
                            ),
                          ).then(
                            (value) {
                              if (value is bool) {
                                if (value) {
                                  context
                                      .read<ProductTransferDetailBloc>()
                                      .add(InitEvent(transfer.id!));
                                }
                              }
                            },
                          );
                        },
                        label: const Text(
                          'Generar Orden de Envio',
                        ),
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Chip(
                        avatar: Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                        label: Text('Verificado'),
                      ),
                    ],
                  ),
                ),
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

class VerificationDialog extends StatelessWidget {
  const VerificationDialog({Key? key})
      : super(key: key);

  @override
  Widget build(context) {
    return BlocBuilder<ProductTransferDetailBloc, ProductTransferDetailState>(
      builder: (context, state) {
        return AlertDialog(
          title: const Text('Generar Orden de Envio'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'Cancelar');
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                context
                    .read<ProductTransferDetailBloc>()
                    .add(const GenerateShipmentOrderEvent());
                Navigator.pop(context, true);
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}
