import 'package:erp_fronted/general_widget/warehouse_drop_down/warehouse_drop_down_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'verify_product_entry_bloc.dart';
import 'verify_product_entry_event.dart';
import 'verify_product_entry_state.dart';

class VerifyProductEntryPage extends StatelessWidget {
  const VerifyProductEntryPage({Key? key, required this.productEntryId})
      : super(key: key);
  final int productEntryId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          VerifyProductEntryBloc()..add(InitEvent(productEntryId)),
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
    return BlocBuilder<VerifyProductEntryBloc, VerifyProductEntryState>(
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
            return const ProductEntryInformation();
          case States.error:
            return Center(
              child: Text('${state.errorMessage}'),
            );
          case States.verified:
            return const Center(
              child: Text('Verificado'),
            );
            break;
        }
      },
    );
  }
}

final _formKey = GlobalKey<FormState>();

class ProductEntryInformation extends StatelessWidget {
  const ProductEntryInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productEntry =
        BlocProvider.of<VerifyProductEntryBloc>(context).state.productEntry;
    final registerDate = DateFormat('EEEE d MMMM, ' 'yy - HH:mm a')
        .format(DateTime.parse(productEntry!.createdAt));
    final quantity = context.watch<VerifyProductEntryBloc>().state.quantity;
    final sectionId = context.watch<VerifyProductEntryBloc>().state.sectionId;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: Card(
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Modelo: ${productEntry.product.modelProduct}',
                        style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.bodyMedium),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Row(
                    children: [
                      Text(
                        'Formato: ${productEntry.product.formatProduct}',
                        style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.bodyMedium),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Row(
                    children: [
                      Text(
                        'Orden de Ingreso: ${productEntry.entryOrder.codeEntryOrder}',
                        style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.bodyMedium),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Row(
                    children: [
                      Text(
                        'Fecha de Registro: $registerDate',
                        style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.bodyMedium),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Row(
                    children: [
                      Text(
                        'Cantidad: ${productEntry.quantity}',
                        style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.bodyMedium),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Ingreso:',
                    style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.bodyMedium),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: TextFormField(
                        style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.bodyMedium),
                        onSaved: (value) {
                          context
                              .read<VerifyProductEntryBloc>()
                              .add(SaveQuantityEvent(int.parse(value!)));
                        },
                        onChanged: (value) {
                          context
                              .read<VerifyProductEntryBloc>()
                              .add(SaveQuantityEvent(int.parse(value)));
                        },
                        decoration: const InputDecoration(
                          labelText: 'Cantidad',
                          border: OutlineInputBorder(),
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],

                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Flexible(
                      flex: 3,
                      child: WarehouseDropDownPage(
                        callbackFunction: (sectionId) {
                          context
                              .read<VerifyProductEntryBloc>()
                              .add(SaveSectionIdEvent(sectionId));
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
                quantity != null && sectionId != null ?
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState != null) {
                        _formKey.currentState?.save();

                        showDialog(
                          context: context,
                          builder: (_) => BlocProvider.value(
                            value: BlocProvider.of<VerifyProductEntryBloc>(
                                context),
                            child: const VerificationDialog(),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Registar Ingreso',
                      style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.bodyMedium),
                    ),
                  ),
                )
                : const SizedBox(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class VerificationDialog extends StatelessWidget {
  const VerificationDialog({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return BlocBuilder<VerifyProductEntryBloc, VerifyProductEntryState>(
      builder: (context, state) {
        return AlertDialog(
          title: const Text('Verificar Entrada de Productos'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                context
                    .read<VerifyProductEntryBloc>()
                    .add(const StoreDataEvent());
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}
