import 'package:built_collection/built_collection.dart';
import 'package:erp_fronted/employee/models/user_model.dart';
import 'package:erp_fronted/product_request/models/product_transfer_model.dart';
import 'package:erp_fronted/transfer_order/models/transfer_order_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return BlocConsumer<CheckTransferOrderBloc, CheckTransferOrderState>(
      listener: (context, state) {
        if (state.dialog == Dialogs.sent) {
          showDialog(
            useSafeArea: true,
            context: context,
            builder: (_) => BlocProvider.value(
              value: BlocProvider.of<CheckTransferOrderBloc>(context),
              child: const SentVerificationDialog(),
            ),
          ).then((value) {
            if (value is bool) {
              if (value) {
                context
                    .read<CheckTransferOrderBloc>()
                    .add(const MarkAsSentEvent());
              }
            }
          });
        }
        if (state.dialog == Dialogs.received) {
          showDialog(
            useSafeArea: true,
            context: context,
            builder: (_) => BlocProvider.value(
              value: BlocProvider.of<CheckTransferOrderBloc>(context),
              child: const ReceivedVerificationDialog(),
            ),
          ).then((value) {
            if (value is bool) {
              if (value) {
                context
                    .read<CheckTransferOrderBloc>()
                    .add(const MarkAsReceivedEvent());
              }
            }
          });
        }
      },
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
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        requestDate,
                        style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8.0,
                    width: 8.0,
                  ),
                  Row(
                    children: [
                      Text(
                        'Solicitado por $employeeName',
                        style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8.0,
                    width: 8.0,
                  ),
                  Row(
                    children: [
                      Text(
                        '$userContact - $userRole',
                        style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8.0,
                    width: 8.0,
                  ),
                  Wrap(
                    children: [
                      Text(
                        branch,
                        style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Aprobado el: $verifiedDate',
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ProductTransferList(
            productTransfer: transferOrder.transfer.productTransfers,
          ),
          TransferControl(
            sent: transferOrder.sent,
            received: transferOrder.received,
          ),
        ],
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
      itemCount: productTransfer.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final modelProduct = '${productTransfer[index].product?.modelProduct}';
        final formatProduct =
            '${productTransfer[index].product?.formatProduct}';
        final quantity = productTransfer[index].quantity;
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('Modelo: $modelProduct'),
              subtitle: Text('Formato: $formatProduct'),
              trailing: Text('Cantidad: ${quantity.toString()} unidades'),
            ),
          ),
        );
      },
    );
  }
}

class TransferControl extends StatelessWidget {
  const TransferControl({Key? key, required this.sent, required this.received})
      : super(key: key);
  final bool sent, received;

  @override
  Widget build(BuildContext context) {
    final int roleId = context.watch<CheckTransferOrderBloc>().state.roleId;
    if (!sent && !received) {

      if (roleId == 1 || roleId == 4) {
        return ElevatedButton(
          onPressed: () {
            context
                .read<CheckTransferOrderBloc>()
                .add(const ShowSentDialogEvent());
          },
          child: const Text('Marcar como Enviado'),
        );
      }
    }
    if (sent && !received) {
      return Column(
        children: [
          const SentInformation(),
          roleId == 5 || roleId == 1
              ? ElevatedButton(
                  onPressed: () {
                    context
                        .read<CheckTransferOrderBloc>()
                        .add(const ShowReceivedDialogEvent());
                  },
                  child: const Text('Marcar como Recibido'),
                )
              : const SizedBox(
                  height: 8.0,
                  width: 8.0,
                ),
        ],
      );
    }
    if (sent && received) {
      return Column(
        children: const [
          SentInformation(),
          ReceivedInformation(),
          Text('Se ha completado el traspaso correctamente'),
        ],
      );
    }
    return const SizedBox(
      height: 8.0,
      width: 8.0,
    );
  }
}

class SentInformation extends StatelessWidget {
  const SentInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = context
        .watch<CheckTransferOrderBloc>()
        .state
        .transferOrder!
        .sentByUser!;
    final String sentDate =
        context.watch<CheckTransferOrderBloc>().state.transferOrder!.sendDate!;
    final sentDateFormatted = DateFormat('EEEE d MMMM, ' 'yy - HH:mm a')
        .format(DateTime.parse(sentDate));
    final String userName =
        '${user.employee?.namesEmployee} ${user.employee?.lastNameEmployee}';
    final String email = user.email;
    final String role = '${user.role?.nameRole}';

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Enviado el: $sentDateFormatted',
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
              width: 8.0,
            ),
            Row(
              children: [
                Text(
                  'Enviado por: $userName',
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
              width: 8.0,
            ),
            Row(
              children: [
                Text(
                  '$role',
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
              width: 8.0,
            ),
            Row(
              children: [
                Text(
                  'Contacto: $email',
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ReceivedInformation extends StatelessWidget {
  const ReceivedInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = context
        .watch<CheckTransferOrderBloc>()
        .state
        .transferOrder!
        .receivedByUser!;
    final String sentDate = context
        .watch<CheckTransferOrderBloc>()
        .state
        .transferOrder!
        .receivedDate!;
    final sentDateFormatted = DateFormat('EEEE d MMMM, ' 'yy - HH:mm a')
        .format(DateTime.parse(sentDate));
    final String userName =
        '${user.employee?.namesEmployee} ${user.employee?.lastNameEmployee}';
    final String email = user.email;
    final String role = '${user.role?.nameRole}';

    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Recibido el: $sentDateFormatted'),
              ],
            ),
            const SizedBox(
              height: 8.0,
              width: 8.0,
            ),
            Row(
              children: [
                Text('Recibido por: $userName'),
              ],
            ),
            const SizedBox(
              height: 8.0,
              width: 8.0,
            ),
            Row(
              children: [
                Text(role),
              ],
            ),
            const SizedBox(
              height: 8.0,
              width: 8.0,
            ),
            Row(
              children: [
                Text('Contacto: $email'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SentVerificationDialog extends StatelessWidget {
  const SentVerificationDialog({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return BlocBuilder<CheckTransferOrderBloc, CheckTransferOrderState>(
      builder: (context, state) {
        return AlertDialog(
          title: const Text('Verificar Envio de Productos'),
          content: const ProductCheckList(),
          actions: [
            TextButton(
              onPressed: () {
                context
                    .read<CheckTransferOrderBloc>()
                    .add(const HideDialogEvent());
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                context
                    .read<CheckTransferOrderBloc>()
                    .add(const HideDialogEvent());
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

class ReceivedVerificationDialog extends StatelessWidget {
  const ReceivedVerificationDialog({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return BlocBuilder<CheckTransferOrderBloc, CheckTransferOrderState>(
      builder: (context, state) {
        return AlertDialog(
          scrollable: true,
          title: const Text('Verificar Recepción de Productos'),
          content: const ProductCheckList(),
          actions: [
            TextButton(
              onPressed: () {
                context
                    .read<CheckTransferOrderBloc>()
                    .add(const HideDialogEvent());
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                context
                    .read<CheckTransferOrderBloc>()
                    .add(const HideDialogEvent());
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

class ProductCheckList extends StatelessWidget {
  const ProductCheckList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = BlocProvider.of<CheckTransferOrderBloc>(context)
        .state
        .transferOrder
        ?.transfer
        .productTransfers;

/*    final products = context
        .watch<CheckTransferOrderBloc>()
        .state
        .transferOrder
        ?.transfer
        .productTransfers;*/
    return ConstrainedBox(
        constraints: const BoxConstraints(
            maxHeight: double.maxFinite, maxWidth: double.maxFinite),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: SizedBox(
              width: 512.0,
              height: 512.0,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: products?.length,
                itemBuilder: (context, index) {
                  final product = products![index];
                  return ListTile(
                    title: Text(
                        '${product.product?.modelProduct} - ${product.product?.formatProduct}'),
                    subtitle: Text('Cantidad: ${product.quantity}'),
                  );
                },
              ),
            ),
          ),
        ));
  }
}
