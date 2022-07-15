import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_search_cubit.dart';
import 'product_search_state.dart';

class ProductSearchPage extends StatelessWidget {
  const ProductSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ProductSearchCubit()..getMostSaleProducts(),
      child: Builder(builder: (context) => ProductSearch()),
    );
  }
}

class ProductSearch extends StatelessWidget {
  ProductSearch({Key? key}) : super(key: key);
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductSearchCubit, ProductSearchState>(
      builder: (context, state) {
        return AlertDialog(
          title: Row(
            children: [
              Flexible(
                child: TextField(
                  controller: _textEditingController,
                  onChanged: (text) {
                    context.read<ProductSearchCubit>().getProducts(text);
                  },
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(
                      Icons.search,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        _textEditingController.clear();
                        context.read<ProductSearchCubit>().getProducts('');
                      },
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
    return BlocBuilder<ProductSearchCubit, ProductSearchState>(
      builder: (context, state) {
        switch (state.state) {
          case States.initial:
            return const SizedBox(
              width: 256.0,
              height: 128.0,
              child: SearchResult(),
            );
          case States.loading:
            return const SizedBox(
              height: 128.0,
              width: 256.0,
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
              child: Center(
                child: Text(
                  '${state.errorMessage}',
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
    final products = context.watch<ProductSearchCubit>().state.products;
    if (products != null) {
      return ListView.builder(
        itemCount: products.products.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final product = products.products[index];
          return ListTile(
            title: Text(product.modelProduct),
            onTap: () {
              Navigator.pop(context, product.id);
            },
          );
        },
      );
    }
    return Container();
  }
}
