import 'package:erp_fronted/product_entry/verify_product_entry/verify_product_entry_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'check_entry_order_bloc.dart';
import 'check_entry_order_event.dart';
import 'check_entry_order_state.dart';

class CheckEntryOrderPage extends StatelessWidget {
  const CheckEntryOrderPage({Key? key, required this.entryOrderId})
      : super(key: key);
  final int entryOrderId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          CheckEntryOrderBloc()..add(InitEvent(entryOrderId)),
      child: Builder(
        builder: (context) => Scaffold(
          body: const StatesView(),
          appBar: AppBar(),
        ),
      ),
    );
  }
}

class StatesView extends StatelessWidget {
  const StatesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckEntryOrderBloc, CheckEntryOrderState>(
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
          case States.unchecked:
            return const CheckEntryOrder();
          case States.checked:
            return const CheckedEntryOrder();
          case States.error:
            return const Center(
              child: Text('Error'),
            );
        }
      },
    );
  }
}

class CheckEntryOrder extends StatelessWidget {
  const CheckEntryOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var showVerifyButton =
        context.watch<CheckEntryOrderBloc>().state.showVerifyButton;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const EntryOrderInformation(),
          const ProductEntryList(),
          const SizedBox(
            height: 8.0,
          ),
          showVerifyButton
              ? Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => BlocProvider.value(
                          value: BlocProvider.of<CheckEntryOrderBloc>(context),
                          child: const VerificationDialog(),
                        ),
                      );
                    },
                    child: const Text('Verificar Orden de Ingreso'),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class EntryOrderInformation extends StatelessWidget {
  const EntryOrderInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String? entryOrderCode = BlocProvider.of<CheckEntryOrderBloc>(context)
        .state
        .entryOrder
        ?.codeEntryOrder;
    final String registerDate = DateFormat('EEEE d MMMM, ' 'yy - HH:mm a')
        .format(DateTime.parse(BlocProvider.of<CheckEntryOrderBloc>(context)
            .state
            .entryOrder!
            .createdAt!));

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                Text(
                  'Codigo de Ingreso: $entryOrderCode',
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                Text(
                  'Fecha de Registro: $registerDate',
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductEntryList extends StatelessWidget {
  const ProductEntryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final entryOrderProduct = BlocProvider.of<CheckEntryOrderBloc>(context)
        .state
        .entryOrder!
        .entryOrderProduct!;
    return ListView.builder(
      itemCount: entryOrderProduct.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        final bool verified = entryOrderProduct[index].verified!;
        return Card(
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VerifyProductEntryPage(
                      productEntryId: entryOrderProduct[index].id!),
                ),
              ).then(
                (value) {
                  context.read<CheckEntryOrderBloc>().add(ReloadEvent());
                },
              );
            },
            title: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'Modelo: ${entryOrderProduct[index].product?.modelProduct}',
                style: GoogleFonts.roboto(
                  textStyle: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'Formato: ${entryOrderProduct[index].product?.formatProduct}',
                style: GoogleFonts.roboto(
                  textStyle: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
            trailing: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cantidad: ${entryOrderProduct[index].quantity}',
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                verified
                    ? const Chip(
                        backgroundColor: Colors.transparent,
                        avatar: Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                        label: Text(
                          'Verificado',
                        ),
                      )
                    : const Chip(
                        backgroundColor: Colors.transparent,
                        avatar: Icon(
                          Icons.hourglass_bottom,
                          color: Colors.yellow,
                        ),
                        label: Text(
                          'Pendiente',
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class VerificationDialog extends StatelessWidget {
  const VerificationDialog({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return BlocBuilder<CheckEntryOrderBloc, CheckEntryOrderState>(
      builder: (context, state) {
        return AlertDialog(
          title: const Text('Verificar Entrada de Productos'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'Cancelar');
                //context.read<CheckEntryOrderBloc>().add(const InitEvent());
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                context.read<CheckEntryOrderBloc>().add(const VerifyEvent());
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('Verificar'),
            ),
          ],
        );
      },
    );
  }
}

class CheckedEntryOrder extends StatelessWidget {
  const CheckedEntryOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final entryOrderProduct = BlocProvider.of<CheckEntryOrderBloc>(context)
        .state
        .entryOrder
        ?.entryOrderProduct;
    return Column(
      children: [
        const Flexible(
          child: EntryOrderInformation(),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: entryOrderProduct?.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(
                  'Modelo: ${entryOrderProduct?[index].product?.modelProduct}',
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                subtitle: Text(
                  'Formato: ${entryOrderProduct?[index].product?.formatProduct}',
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                trailing: Text(
                  'Cantidad: ${entryOrderProduct?[index].quantity}',
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
