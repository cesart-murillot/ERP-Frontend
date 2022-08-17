import 'package:erp_fronted/entry_order/check_entry_order/check_entry_order_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'index_entry_order_bloc.dart';
import 'index_entry_order_event.dart';
import 'index_entry_order_state.dart';

class IndexEntryOrderPage extends StatelessWidget {
  const IndexEntryOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => IndexEntryOrderBloc()..add(InitEvent()),
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
    return BlocBuilder<IndexEntryOrderBloc, IndexEntryOrderState>(
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
          case States.loadedAll:
            return const AllEntryOrders();
          case States.loadedVerified:
            return const Center(
              child: Text('LoadedVerified'),
            );
          case States.loadedPendent:
            return const Center(
              child: Text('LoadedPendent'),
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

class AllEntryOrders extends StatelessWidget {
  const AllEntryOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final entryOrders = BlocProvider.of<IndexEntryOrderBloc>(context)
        .state
        .entryOrders
        ?.entryOrders;
    return ListView.builder(
      itemCount: entryOrders?.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (entryOrders![index].verifiedEntryOrder! &&
                    !entryOrders[index].errorEntryOrder!)
                  const Chip(
                    label: Text('Verificado'),
                    avatar: Icon(
                      Icons.verified,
                      color: Colors.green,
                    ),
                  ),
                if (entryOrders[index].errorEntryOrder! &&
                    entryOrders[index].verifiedEntryOrder!)
                  const Chip(
                    label: Text('Error'),
                    avatar: Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                  ),
                if (!entryOrders[index].verifiedEntryOrder!)
/*                  const Icon(
                    Icons.hourglass_bottom,
                    color: Colors.lightBlueAccent,
                  ),*/
                  const Chip(
                    label: Text('Sin Verificar'),
                    avatar: Icon(
                      Icons.hourglass_bottom,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
              ],
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0),
              child: Text(
                'Codigo de Orden: ${entryOrders[index].codeEntryOrder}',
                style: GoogleFonts.roboto(
                  textStyle: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Fecha de Registro: ${DateFormat('EEEE d MMMM, ' 'yy - HH:mm a').format(DateTime.parse(entryOrders[index].createdAt!))}',
                style: GoogleFonts.roboto(
                  textStyle: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CheckEntryOrderPage(
                    entryOrderId: entryOrders[index].id!,
                  ),
                ),
              ).then((value) =>
                  context.read<IndexEntryOrderBloc>().add(const ReloadEvent()));
            },
          ),
        );
      },
    );
  }
}
