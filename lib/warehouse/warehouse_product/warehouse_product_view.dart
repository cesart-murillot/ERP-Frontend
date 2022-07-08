import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'warehouse_product_bloc.dart';
import 'warehouse_product_event.dart';
import 'warehouse_product_state.dart';

class WarehouseProductPage extends StatelessWidget {
  const WarehouseProductPage({Key? key, required this.warehouseId})
      : super(key: key);
  final int warehouseId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          WarehouseProductBloc()..add(InitEvent(warehouseId)),
      child: Builder(
          builder: (context) => Scaffold(
                appBar: AppBar(),
                body: const StateViews(),
              )),
    );
  }
}

class StateViews extends StatelessWidget {
  const StateViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WarehouseProductBloc, WarehouseProductState>(
      builder: (context, state) {
        switch (state.state) {
          case States.initial:
            return const Center(
              child: Text('Initial State'),
            );
            break;
          case States.loading:
            return const Center(child: CircularProgressIndicator());
            break;
          case States.loaded:
            return const WarehouseProduct();
            break;
          case States.error:
            return Center(
              child: Text('${state.errorMessage}'),
            );
            break;
        }
      },
    );
  }
}

class WarehouseProduct extends StatelessWidget {
  const WarehouseProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productList = context.read<WarehouseProductBloc>().state.products;
    if (productList != null) {
      final products = productList.products;

      return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(
              product.modelProduct,
            ),
            subtitle: Text(
              '${product.formatProduct}',
            ),
          );
        },
      );
    }
    return Container();
  }
}
