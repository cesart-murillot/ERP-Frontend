import 'package:erp_fronted/inventory/detail_product_inventory/detail_product_inventory_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_inventory_bloc.dart';
import 'product_inventory_event.dart';
import 'product_inventory_state.dart';

class ProductInventoryPage extends StatelessWidget {
  const ProductInventoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          ProductInventoryBloc()..add(InitEvent()),
      child: Builder(
        builder: (context) => const StateViews(),
      ),
    );
  }
}

class StateViews extends StatelessWidget {
  const StateViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductInventoryBloc, ProductInventoryState>(
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
            return const ProductInventory();
          case States.error:
            return Center(
              child: Text('${state.errorMessage}'),
            );
        }
      },
    );
  }
}

class ProductInventory extends StatelessWidget {
  const ProductInventory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products =
        BlocProvider.of<ProductInventoryBloc>(context).state.products;
    final quantities =
        BlocProvider.of<ProductInventoryBloc>(context).state.quantities;
    return ListView.builder(
      itemCount: products!.length,
      itemBuilder: (context, index) {
        final quantity = quantities!.firstWhere(
            (element) => element['product_id'] == products[index].id);
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            contentPadding: const EdgeInsets.all(8.0),
            title: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'Modelo: ${products[index].modelProduct}',
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'Formato: ${products[index].formatProduct}',
              ),
            ),
            trailing: Text('${quantity['quantity']} unidades'),
            leading: const FlutterLogo(),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailProductInventoryPage(
                    productId: products[index].id!,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
