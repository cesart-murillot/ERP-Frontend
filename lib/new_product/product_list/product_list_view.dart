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
              ).then(
                (value) {},
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
                if (state.products!.products[index].urlImageProduct != null) {
                  final imageUrl = Uri(
                    host: '127.0.0.1',
                    port: 8000,
                    path: state.products!.products[index].urlImageProduct,
                    scheme: 'http',
                  );
                  print(imageUrl);
                }
                final product = state.products!.products[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(8.0),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProductDetailPage(
                              productId: state.products!.products[index].id!),
                        ),
                      );
                    },
                    leading: FlutterLogo(),
                    title: Text(
                      '${state.products?.products[index].modelProduct}',
                    ),
                    subtitle: Text(
                      'Formato: ${state.products?.products[index].formatProduct}',
                    ),
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
