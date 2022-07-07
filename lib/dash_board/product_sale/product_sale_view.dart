import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_sale_cubit.dart';
import 'product_sale_state.dart';

class ProductSalePage extends StatelessWidget {
  const ProductSalePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ProductSaleCubit()..soldProductsThisYear(),
      child: Builder(builder: (context) => const StateViews()),
    );
  }
}

class StateViews extends StatelessWidget {
  const StateViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductSaleCubit, ProductSaleState>(
      builder: (context, state) {
        switch (state.state) {
          case States.initial:
            return const Center(
              child: Text('Initial State'),
            );
            break;
          case States.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
            break;
          case States.loaded:
            return const Center(
              child: ProductSale(),
            );
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

class ProductSale extends StatelessWidget {
  const ProductSale({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = context.watch<ProductSaleCubit>().state.quantity;
    if (data != null) {
      return Flexible(
        child: charts.BarChart(data),
      );
    }
    return const SizedBox();
  }
}
