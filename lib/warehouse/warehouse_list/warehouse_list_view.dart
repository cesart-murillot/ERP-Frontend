import 'package:erp_fronted/warehouse/product_per_branch/product_per_branch_view.dart';
import 'package:erp_fronted/warehouse/warehouse_product/warehouse_product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'warehouse_list_bloc.dart';
import 'warehouse_list_event.dart';
import 'warehouse_list_state.dart';

class WarehouseListPage extends StatelessWidget {
  const WarehouseListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => WarehouseListBloc()..add(InitEvent()),
      child: Builder(
        builder: (context) =>
            BlocBuilder<WarehouseListBloc, WarehouseListState>(
          builder: (context, state) {
            final isAdmin = context.read<WarehouseListBloc>().state.isAdmin;
            return Scaffold(
              appBar: isAdmin ? AppBar() : null,
              body: const StateViews(),
            );
          },
        ),
      ),
    );
  }
}

class StateViews extends StatelessWidget {
  const StateViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WarehouseListBloc, WarehouseListState>(
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
            break;
          case States.loaded:
            if (state.isAdmin) {
              return const BranchList();
            }
            return const WarehouseList();
          case States.error:
            return Center(
              child: Text(
                'Error ${state.errorMessage}',
              ),
            );
        }
      },
    );
  }
}

class BranchList extends StatelessWidget {
  const BranchList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final branches =
        BlocProvider.of<WarehouseListBloc>(context).state.branches!.branches;
    return ListView.builder(
      itemCount: branches.length,
      itemBuilder: (context, index) {
        final branch = branches[index];
        return Card(
          child: ListTile(
            onTap: () {
              context
                  .read<WarehouseListBloc>()
                  .add(ShowBranchEvent(branch.id!));
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                    value: BlocProvider.of<WarehouseListBloc>(context),
                    child: const WarehouseList(),
                  ),
                ),
              );
            },
            isThreeLine: true,
            title: Text(
              '${branch.nameBranch}',
            ),
            subtitle: Column(
              children: [
                Row(
                  children: [
                    Text(
                      '${branch.addressBranch}',
                    ),
                  ],
                ),
              ],
            ),
            trailing: Chip(
              label: Text(
                '${branch.typeBranch}',
              ),
            ),
          ),
        );
      },
    );
  }
}

class WarehouseList extends StatelessWidget {
  const WarehouseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isAdmin = context.watch<WarehouseListBloc>().state.isAdmin;
    final branch = context.watch<WarehouseListBloc>().state.branch;
    if (branch == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Sucursal: ${branch.nameBranch}',
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Dirección: ${branch.addressBranch}',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ActionChip(
                        label: const Text('Ver todos los productos'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  ProductPerBranchPage(branchId: branch.id!),
                            ),
                          );
                        },
                        backgroundColor: Colors.transparent,
                        avatar: const Icon(Icons.looks),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: branch.warehouses.length,
            itemBuilder: (context, index) {
              final warehouse = branch.warehouses[index];
              return Card(
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => WarehouseProductPage(
                          warehouseId: branch.warehouses[index].id!,
                        ),
                      ),
                    );
                  },
                  title: Text(warehouse.nameWarehouse),
                  subtitle: Text(
                      'Número de Secciones: ${warehouse.sections!.length}'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
