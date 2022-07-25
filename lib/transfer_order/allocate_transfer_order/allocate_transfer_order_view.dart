import 'package:erp_fronted/search_bar/section_search/section_search_view.dart';
import 'package:erp_fronted/search_bar/warehouse_search/warehouse_search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'allocate_transfer_order_bloc.dart';
import 'allocate_transfer_order_event.dart';
import 'allocate_transfer_order_state.dart';

class AllocateTransferOrderPage extends StatelessWidget {
  const AllocateTransferOrderPage({Key? key, required this.transferOrderId})
      : super(key: key);
  final int transferOrderId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          AllocateTransferOrderBloc()..add(InitEvent(transferOrderId)),
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
    return BlocBuilder<AllocateTransferOrderBloc, AllocateTransferOrderState>(
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
            return const AllocateTransferOrder();
          case States.error:
            return Center(
              child: Text(
                state.errorMessage,
              ),
            );
        }
      },
    );
  }
}

class AllocateTransferOrder extends StatelessWidget {
  const AllocateTransferOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productTransfer =
        context.read<AllocateTransferOrderBloc>().state.productTransfer;
    final sections = context.watch<AllocateTransferOrderBloc>().state.sections;
    if (productTransfer != null) {
      return Column(
        children: [
          Card(
            child: ListTile(
              title: Text(
                '${productTransfer.product?.modelProduct ?? ' '} - ${productTransfer.product?.formatProduct ?? ' '}',
              ),
              subtitle: Text(
                'Cantidad: ${productTransfer.quantity}',
              ),
            ),
          ),
          const SizedBox(
            height: 8.0,
            width: 8.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => const WarehouseSearchPage(),
                  ).then(
                    (warehouseId) {
                      if (warehouseId != null && warehouseId is int) {
                        context
                            .read<AllocateTransferOrderBloc>()
                            .add(AddWarehouseEvent(warehouseId));
                      }
                    },
                  );
                },
                child: const Text(
                  'Añadir Ubicación',
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8.0,
            width: 8.0,
          ),
          const AllocationPlace(),
          const SizedBox(
            height: 8.0,
            width: 8.0,
          ),
          sections.isNotEmpty && sections.every((element) => element != null)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton.extended(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => BlocProvider.value(
                            value: BlocProvider.of<AllocateTransferOrderBloc>(
                                context),
                            child: const ConfirmationDialog(),
                          ),
                        );
                      },
                      label: const Text('Registrar'),
                    ),
                  ],
                )
              : const SizedBox(
                  height: 8.0,
                  width: 8.0,
                ),
        ],
      );
    }
    return Container();
  }
}

class AllocationPlace extends StatelessWidget {
  const AllocationPlace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final warehouses =
        context.watch<AllocateTransferOrderBloc>().state.warehouses;
    final sections = context.watch<AllocateTransferOrderBloc>().state.sections;
    final quantities =
        context.watch<AllocateTransferOrderBloc>().state.quantities;
    return FittedBox(
      child: DataTable(
        columns: const [
          DataColumn(
            label: Text('Cantidad'),
          ),
          DataColumn(
            label: Text('Almacen'),
          ),
          DataColumn(
            label: Text('Sección'),
          ),
        ],
        rows: List.generate(
          warehouses.length,
          (index) {
            final warehouse = warehouses[index];
            final section = sections[index];
            return DataRow(
              cells: [
                DataCell(
                  TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    controller: quantities[index],
                  ),
                ),
                DataCell(
                  Text(warehouse.nameWarehouse),
                ),
                DataCell(
                  section == null
                      ? TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (_) =>
                                  SectionSearchPage(warehouseId: warehouse.id!),
                            ).then(
                              (sectionId) {
                                if (sectionId != null && sectionId is int) {
                                  context
                                      .read<AllocateTransferOrderBloc>()
                                      .add(AddSectionEvent(sectionId, index));
                                }
                              },
                            );
                          },
                          child: const Text('Añadir Sección'),
                        )
                      : Text(section.nameSection),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllocateTransferOrderBloc, AllocateTransferOrderState>(
      builder: (context, state) {
        return AlertDialog(
          title: const Text('Generar Cotización'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                context.read<AllocateTransferOrderBloc>().add(const AllocateProductEvent());
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
