import 'package:built_collection/built_collection.dart';
import 'package:erp_fronted/branch/models/branch_model.dart';
import 'package:erp_fronted/employee/models/user_model.dart';
import 'package:erp_fronted/product_request/models/product_transfer_model.dart';
import 'package:erp_fronted/product_request/models/transfer_model.dart';
import 'package:erp_fronted/product_request/verify_product_request/verify_product_request_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'verify_product_request_bloc.dart';
import 'verify_product_request_event.dart';

class VerifyProductRequestPage extends StatelessWidget {
  const VerifyProductRequestPage({Key? key, required this.transferId})
      : super(key: key);

  final int transferId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          VerifyProductRequestBloc()..add(InitEvent(transferId)),
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(),
          body: const StateViews(),
        ),
      ),
    );
  }
}

class StateViews extends StatelessWidget {
  const StateViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerifyProductRequestBloc, VerifyProductRequestState>(
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
            if (state.transfer != null) {
              return ProductRequest(
                transfer: state.transfer!,
              );
            }
            return const Center(
              child: Text('Error'),
            );
        }
      },
    );
  }
}

class ProductRequest extends StatelessWidget {
  const ProductRequest({Key? key, required this.transfer}) : super(key: key);
  final Transfer transfer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserInformation(
          user: transfer.user!,
        ),
        BranchInformation(
          branch: transfer.branch!,
        ),
        ProductTransferList(
          productTransfer: transfer.productTransfers,
        ),
        !transfer.verified!
            ? ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => BlocProvider.value(
                      value: BlocProvider.of<VerifyProductRequestBloc>(context),
                      child: VerificationDialog(productRequestId: transfer.id!),
                    ),
                  ).then(
                    (value) {
                      if (value is bool) {
                        if (value) {
                          context
                              .read<VerifyProductRequestBloc>()
                              .add(InitEvent(transfer.id!));
                        }
                      }
                    },
                  );
                },
                child: const Text('Generar Orden de Envio'),
              )
            : const Text('Se genero la orden de envio'),
      ],
    );
  }
}

class UserInformation extends StatelessWidget {
  const UserInformation({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                    'Solicitado por:\n${user.employee?.namesEmployee} ${user.employee?.lastNameEmployee} - ${user.role?.nameRole}'),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                Text('Contacto: ${user.email}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BranchInformation extends StatelessWidget {
  const BranchInformation({Key? key, required this.branch}) : super(key: key);
  final Branch branch;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Sucursal: ${branch.nameBranch}'),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                Text('Direccion: ${branch.addressBranch}'),
              ],
            ),
          ],
        ),
      ),
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
      shrinkWrap: true,
      itemCount: productTransfer.length,
      itemBuilder: (context, index) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(productTransfer[index].product!.modelProduct),
              trailing: Text('Cantidad: ${productTransfer[index].quantity}'),
            ),
          ),
        );
      },
    );
  }
}

class VerificationDialog extends StatelessWidget {
  const VerificationDialog({Key? key, required this.productRequestId})
      : super(key: key);
  final int productRequestId;

  @override
  Widget build(context) {
    return BlocBuilder<VerifyProductRequestBloc, VerifyProductRequestState>(
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
                    .read<VerifyProductRequestBloc>()
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
