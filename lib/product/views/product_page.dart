import 'package:erp_fronted/main/navigator/bloc/navigator_bloc.dart';
import 'package:erp_fronted/product/bloc/product_bloc.dart';
import 'package:erp_fronted/product/views/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../src/resources/repository.dart';

/*
class ProductPageNavigator extends StatelessWidget {
  const ProductPageNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //context.read<ProductBloc>().add(ProductEventGetProductList());
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              ProductBloc(Repository())..add(ProductEventGetProductList()),
        ),
      ],
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          return Navigator(
            pages: [
              const MaterialPage(
                child: ProductPage(),
              ),
              if (state is ProductStateShowProduct)
                MaterialPage(
                  fullscreenDialog: true,
                  child: ProductDetailPage(
                    product: state.product,
                  ),
                )
            ],
            onPopPage: (route, result) {
              return route.didPop(result);
            },
          );
        },
      ),
    );
*/
/*    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return Navigator(
          pages: const [
            MaterialPage(
              child: ProductPage(),
            ),
*//*
 */
/*            if (state is ProductStateShowProduct)
              const MaterialPage(
                child: ProductDetailPage(),
              ),*//*
 */
/*
          ],
          onPopPage: (route, result) {
            return route.didPop(result);
          },
        );
      },
    );*//*

  }
}
*/

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const ProductList(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        print('hola');
        context.read<NavigatorBloc>().add(const NavigatorEventProductCreate());
      }),
    );
  }
}

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductBloc>(
      create: (_) => ProductBloc(Repository())..add(ProductEventGetProductList()),
      child: BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
        if (state is ProductStateLoading) {
          return const CircularProgressIndicator();
        }
        if (state is ProductStateProductListLoaded) {
          return ListView.builder(
            itemCount: state.products.products.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                contentPadding: const EdgeInsets.all(8.0),
                title: Text(state.products.products[index].modelProduct),
                leading: const FlutterLogo(),
                onTap: () {
                  context.read<NavigatorBloc>().add(NavigatorEventProductDetail(state.products.products[index]));
                  /*context.read<ProductBloc>().add(ProductEventGetProductDetails(
                      state.products.products[index]));*/
                },
              );
            },
          );
        }
        if (state is ProductStateError) {
          return const Center(
            child: Text(
              'Network Error',
            ),
          );
        }
        return const Text(
          'Serious error',
        );
      }),
    );
  }
}
