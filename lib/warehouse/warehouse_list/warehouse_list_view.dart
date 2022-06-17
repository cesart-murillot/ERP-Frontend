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
                      '${branch.typeBranch}',
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '${branch.addressBranch}',
                    ),
                  ],
                ),
              ],
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
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: branch.warehouses.length,
            itemBuilder: (context, index) {
              final warehouse = branch.warehouses[index];
              return Card(
                child: ListTile(
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
