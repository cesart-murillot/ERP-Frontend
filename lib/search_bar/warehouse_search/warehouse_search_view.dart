import 'package:erp_fronted/branch/models/warehouse_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'warehouse_search_cubit.dart';
import 'warehouse_search_state.dart';

class WarehouseSearchPage extends StatelessWidget {
  const WarehouseSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => WarehouseSearchCubit()..getWarehouses(),
      child: Builder(builder: (context) => WarehouseSearch()),
    );
  }
}

class WarehouseSearch extends StatelessWidget {
  WarehouseSearch({Key? key}) : super(key: key);
  final TextEditingController _warehouseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WarehouseSearchCubit, WarehouseSearchState>(
      builder: (context, state) {
        return AlertDialog(
          title: Row(
            children: [
              Flexible(
                child: TextField(
                  controller: _warehouseController,
                  onChanged: (text) {},
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(
                      Icons.search,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.clear,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          content: const StateViews(),
        );
      },
    );
  }
}

class StateViews extends StatelessWidget {
  const StateViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WarehouseSearchCubit, WarehouseSearchState>(
      builder: (context, state) {
        switch (state.state) {
          case States.initial:
            return const SizedBox(
              width: 256.0,
              height: 128.0,
              child: Center(
                child: Text(
                  'Initial State',
                ),
              ),
            );
            break;
          case States.loading:
            return const SizedBox(
              width: 256.0,
              height: 128.0,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
            break;
          case States.loaded:
            return const SizedBox(
              width: 256.0,
              height: 128.0,
              child: SearchResult(),
            );
            break;
          case States.error:
            return SizedBox(
              width: 256.0,
              height: 128.0,
              child: Center(
                child: Text(
                  state.errorMessage,
                ),
              ),
            );
            break;
        }
      },
    );
  }
}

class SearchResult extends StatelessWidget {
  const SearchResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final warehouses = context.watch<WarehouseSearchCubit>().state.warehouses;
    if (warehouses != null) {
      return ListView.builder(
        itemCount: warehouses.warehouses.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final Warehouse warehouse = warehouses.warehouses[index];
          return ListTile(
            title: Text(warehouse.nameWarehouse),
            onTap: () {
              Navigator.pop(context, warehouse.id);
            },
          );
        },
      );
    }
    return Container();
  }
}
