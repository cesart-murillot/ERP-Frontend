import 'package:erp_fronted/inventory/product_transfer_detail/product_transfer_detail_view.dart';
import 'package:erp_fronted/transfer_order/product_shipment/product_shipment_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'product_transfer_bloc.dart';
import 'product_transfer_event.dart';
import 'product_transfer_state.dart';

class ProductTransferPage extends StatelessWidget {
  const ProductTransferPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ProductTransferBloc()..add(const InitEvent()),
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
            if (state.roleId == 1) {
              return const TabTransfer();
            }
            if (state.roleId == 4) {
              return const TabShipment();
            }
            if (state.roleId == 5) {
              return const TabArrival();
            }
            return const SizedBox();
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

class TabArrival extends StatelessWidget {
  const TabArrival({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Flexible(
            flex: 0,
            child: TabBar(
              tabs: [
                Tab(
                  icon: const Icon(
                    Icons.transfer_within_a_station,
                    color: Colors.cyanAccent,
                  ),
                  child: Text(
                    'Traspasos',
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.labelSmall,
                      color: Colors.black,
                    ),
                  ),
                ),
                Tab(
                  icon: const Icon(
                    Icons.input,
                    color: Colors.lightGreenAccent,
                  ),
                  child: Text(
                    'Llegadas',
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.labelSmall,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            flex: 1,
            child: TabBarView(
              children: [
                ProductTransfer(),
                ProductShipmentPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TabShipment extends StatelessWidget {
  const TabShipment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Flexible(
            flex: 0,
            child: TabBar(
              tabs: [
                Tab(
                  icon: const Icon(
                    Icons.transfer_within_a_station,
                    color: Colors.cyanAccent,
                  ),
                  child: Text(
                    'Traspasos',
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.labelSmall,
                      color: Colors.black,
                    ),
                  ),
                ),
                Tab(
                  icon: const Icon(
                    Icons.local_shipping,
                    color: Colors.orangeAccent,
                  ),
                  child: Text(
                    'Envios',
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.labelSmall,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            flex: 1,
            child: TabBarView(
              children: [
                ProductTransfer(),
                ProductShipmentPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class TabTransfer extends StatelessWidget {
  const TabTransfer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Flexible(
            flex: 0,
            child: TabBar(
              tabs: [
                Tab(
                  icon: const Icon(
                    Icons.transfer_within_a_station,
                    color: Colors.cyanAccent,
                  ),
                  child: Text(
                    'Traspasos',
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.labelSmall,
                      color: Colors.black,
                    ),
                  ),
                ),
                Tab(
                  icon: const Icon(
                    Icons.local_shipping,
                    color: Colors.orangeAccent,
                  ),
                  child: Text(
                    'Envios',
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.labelSmall,
                      color: Colors.black,
                    ),
                  ),
                ),
                Tab(
                  icon: const Icon(
                    Icons.input,
                    color: Colors.lightGreenAccent,
                  ),
                  child: Text(
                    'Llegadas',
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.labelSmall,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            flex: 1,
            child: TabBarView(
              children: [
                ProductTransfer(),
                ProductShipmentPage(),
                ProductShipmentPage(),
              ],
            ),
          ),
        ],
      ),
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
                ).then((value) => context.read<ProductTransferBloc>().add(const InitEvent()));
              },
              title: Column(
                children: [
                  Wrap(
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
