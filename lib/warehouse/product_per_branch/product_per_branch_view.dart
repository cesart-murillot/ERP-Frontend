import 'package:erp_fronted/inventory/detail_product_inventory/detail_product_inventory_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_per_branch_bloc.dart';
import 'product_per_branch_event.dart';
import 'product_per_branch_state.dart';

class ProductPerBranchPage extends StatelessWidget {
  const ProductPerBranchPage({Key? key, required this.branchId})
      : super(key: key);
  final int branchId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          ProductPerBranchBloc()..add(InitEvent(branchId)),
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
    return BlocBuilder<ProductPerBranchBloc, ProductPerBranchState>(
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
            return const ProductPerBranch();
          case States.error:
            return Center(
              child: Text(
                '${state.errorMessage}',
              ),
            );
        }
      },
    );
  }
}

class ProductPerBranch extends StatelessWidget {
  const ProductPerBranch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productList = context.read<ProductPerBranchBloc>().state.products;
    if (productList != null) {
      final products = productList.products;
      return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          final int remainUnits = product.remainUnits ?? 0;
          final int reorderPoint = product.reorderPoint ?? 0;
          final int estimateTime = product.estimateTime ?? 0;
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailProductInventoryPage(
                      productId: product.id!,
                    ),
                  ),
                );
              },
              leading: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.zero,
                  border: Border.all(
                    width: 2.0,
                    color: reorderPoint > remainUnits
                        ? Colors.red
                        : reorderPoint < remainUnits
                            ? Colors.green
                            : Colors.yellow,
                  ),
                ),
                child: const FlutterLogo(
                  size: 48.0,
                ),
              ),
              title: Text(product.modelProduct),
              subtitle: Text('${product.formatProduct}'),
              trailing: Column(
                children: [
                  Chip(
                    label: Text(
                      '${product.remainUnits} uds.',
                    ),
                    backgroundColor: reorderPoint > remainUnits
                        ? Colors.red.shade300
                        : reorderPoint < remainUnits
                            ? Colors.green.shade300
                            : Colors.yellow.shade300,
                  ),
                  estimateTime > 0
                      ? Text('$estimateTime semanas restantes')
                      : const Text('Cantidad insuficiente'),
                ],
              ),
            ),
          );
        },
      );
    }
    return const SizedBox();
  }
}
