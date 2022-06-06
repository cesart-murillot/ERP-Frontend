import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Flexible(
          child: EntryOrderInformation(),
        ),
        const ProductList(),
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
                  child: const Text('Validar'),
                ),
              )
            : Container(),
      ],
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Codigo de Ingreso: $entryOrderCode'),
        Text('Fecha de Registro: $registerDate}'),
      ],
    );
  }
}

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final entryOrderProduct = BlocProvider.of<CheckEntryOrderBloc>(context)
        .state
        .entryOrder
        ?.entryOrderProduct;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: entryOrderProduct?.length,
      itemBuilder: (BuildContext context, int index) {
        return CheckboxListTile(
          title: Text(
              'Modelo: ${entryOrderProduct![index].product?.modelProduct}'),
          subtitle: Text(
              'Formato: ${entryOrderProduct[index].product?.formatProduct}'),
          onChanged: (bool? value) {
            context
                .read<CheckEntryOrderBloc>()
                .add(MarkAsCheckedEvent(index, value!));
          },
          value: context.watch<CheckEntryOrderBloc>().state.verified![index],
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
            return ListTile(
              title: Text('Modelo: ${entryOrderProduct?[index].product?.modelProduct}'),
              subtitle: Text('Formato: ${entryOrderProduct?[index].product?.formatProduct}'),
              trailing: Text('Cantidad: ${entryOrderProduct?[index].quantity}'),
            );
          },
        ),
      ],
    );
  }
}
