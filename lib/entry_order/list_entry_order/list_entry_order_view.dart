import 'package:erp_fronted/entry_order/check_entry_order/check_entry_order_view.dart';
import 'package:erp_fronted/entry_order/register_entry_order/register_entry_order_view.dart';
import 'package:erp_fronted/src/resources/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'list_entry_order_bloc.dart';
import 'list_entry_order_event.dart';
import 'list_entry_order_state.dart';

class ListEntryOrderPage extends StatelessWidget {
  const ListEntryOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          ListEntryOrderBloc(Repository())..add(const FetchList()),
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RegisterEntryOrderPage(),
              ),
            ).then((value) {
              context.read<ListEntryOrderBloc>().add(const FetchList());
            });
          },
          icon: const Icon(Icons.app_registration, color: Colors.black),
          label: const Text('Registrar'),
        ),
        body: const ListEntryOrder(),
      ),
    );
  }
}

class TabEntryOrder extends StatelessWidget {
  const TabEntryOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          Flexible(
            flex: 0,
            child: TabBar(
              tabs: [
                Tab(
                  icon: const Icon(
                    Icons.hourglass_bottom,
                    color: Colors.black,
                  ),
                  child: Text(
                    'Pendiente',
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.labelSmall,
                      color: Colors.black,
                    ),
                  ),
                  //child: Text('hola'),
                ),
                Tab(
                  icon: const Icon(
                    Icons.verified,
                    color: Colors.black,
                  ),
                  child: Text(
                    'Verificado',
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.labelSmall,
                      color: Colors.black,
                    ),
                  ),
                ),
                Tab(
                  icon: const Icon(
                    Icons.error,
                    color: Colors.black,
                  ),
                  child: Text(
                    'Error',
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.labelSmall,
                      color: Colors.black,
                    ),
                  ),
                ),
                Tab(
                  icon: const Icon(
                    Icons.all_inbox,
                    color: Colors.black,
                  ),
                  child: Text(
                    'Todas',
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.labelSmall,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: TabBarView(
              children: [
                const ListEntryOrder(),
                Container(
                  color: Colors.black,
                ),
                Container(
                  color: Colors.pink,
                ),
                Container(
                  color: Colors.pink,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ListEntryOrder extends StatelessWidget {
  const ListEntryOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListEntryOrderBloc, ListEntryOrderState>(
      builder: (context, state) {
        if (state is FetchingListState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is LoadedListState) {
          return Column(
            children: [
              Flexible(
                child: ListView.builder(
                  itemCount: state.entryOrders.entryOrders.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.only(
                          left: 16.0, top: 8.0, right: 16.0, bottom: 8.0),
                      child: ListTile(
                        trailing: Column(
                          children: [
                            if (state.entryOrders.entryOrders[index]
                                    .verifiedEntryOrder! &&
                                !state.entryOrders.entryOrders[index]
                                    .errorEntryOrder!)
                              const Icon(
                                Icons.verified,
                                color: Colors.green,
                              ),
                            if (state.entryOrders.entryOrders[index]
                                    .errorEntryOrder! &&
                                state.entryOrders.entryOrders[index]
                                    .verifiedEntryOrder!)
                              const Icon(
                                Icons.error,
                                color: Colors.red,
                              ),
                            if (!state.entryOrders.entryOrders[index]
                                .verifiedEntryOrder!)
                              const Icon(
                                Icons.hourglass_bottom,
                                color: Colors.lightBlueAccent,
                              )
                          ],
                        ),
                        contentPadding: const EdgeInsets.all(8.0),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CheckEntryOrderPage(
                                entryOrderId:
                                    state.entryOrders.entryOrders[index].id!,
                              ),
                            ),
                          );
                        },
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Wrap(
                            children: [
                              const Text('Código de Orden: '),
                              Text(
                                state.entryOrders.entryOrders[index]
                                    .codeEntryOrder,
                              ),
                            ],
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Wrap(
                            children: [
                              const Text('Fecha de Registro: '),
                              Text(
                                DateFormat('EEEE d MMMM, ' 'yy - HH:mm a')
                                    .format(DateTime.parse(state.entryOrders
                                        .entryOrders[index].createdAt!)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }
        if (state is ErrorState) {
          return Text(state.error);
        }
        return Container();
      },
    );
  }
}

class FilterChips extends StatelessWidget {
  const FilterChips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: const [
        ChoiceChip(label: Text('Verificados'), selected: true),
        ChoiceChip(label: Text('Pendientes'), selected: false),
        ChoiceChip(label: Text('Reportados'), selected: false),
      ],
    );
  }
}
