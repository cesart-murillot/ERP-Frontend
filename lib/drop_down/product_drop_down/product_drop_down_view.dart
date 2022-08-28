import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_drop_down_cubit.dart';
import 'product_drop_down_state.dart';

class ProductDropDownPage extends StatelessWidget {
  const ProductDropDownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ProductDropDownCubit()..getProducts(),
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
    return BlocBuilder<ProductDropDownCubit, ProductDropDownState>(
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
            return const ProductDropDown();
          case States.error:
            return Center(
              child: Text(
                state.errorMessage,
              ),
            );
        }
      },
    );
  }
}

class ProductDropDown extends StatelessWidget {
  const ProductDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = context.read<ProductDropDownCubit>().state.products;
    if (products != null) {
      return ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 256.0,
          maxHeight: 256.0,
        ),
        child: Dialog(
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final product = products.products[index];
                    return ListTile(
                      title: Text(product.modelProduct),
                      subtitle: Text(product.formatProduct ?? ' '),
                      onTap: () {
                        Navigator.pop(context, product);
                      },
                    );
                  },
                  childCount: products.products.length,
                ),
              ),
            ],
          ),
        ),
      );
    }
    return const SizedBox();
  }
}
