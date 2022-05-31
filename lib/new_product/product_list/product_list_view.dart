import 'package:erp_fronted/new_product/product_add/product_add_view.dart';
import 'package:erp_fronted/new_product/product_detail/product_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_list_bloc.dart';
import 'product_list_event.dart';
import 'product_list_state.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ProductListBloc()..add(InitEvent()),
      child: Builder(
        builder: (context) => Scaffold(
          body: const ProductList(),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ProductAddPage(),
                ),
              );
            },
            label: const Text('Añadir Producto'),
          ),
        ),
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductListBloc, ProductListState>(
      builder: (context, state) {
        switch (state.state) {
          case ProductListViewState.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ProductListViewState.loaded:
            return ListView.builder(
              itemCount: state.products!.products.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProductDetailPage(productId: state.products!.products[index].id!),
                        ),
                      );
                    },
                    title:
                        Text('${state.products?.products[index].modelProduct}'),
                  ),
                );
              },
            );
          case ProductListViewState.initial:
            return const Center(
              child: CircularProgressIndicator(),
            );
        }
      },
    );
  }
}
