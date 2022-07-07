import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'best_seller_cubit.dart';
import 'best_seller_state.dart';

class BestSellerPage extends StatelessWidget {
  const BestSellerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => BestSellerCubit()..bestSellerThisYear(),
      child: Builder(builder: (context) => const StateViews()),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<BestSellerCubit>(context);

    return Container();
  }
}

class StateViews extends StatelessWidget {
  const StateViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestSellerCubit, BestSellerState>(
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
            return const BestSeller();
            break;
          case States.error:
            return Container();
            break;
        }
      },
    );
  }
}

class BestSeller extends StatelessWidget {
  const BestSeller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productModel = context.watch<BestSellerCubit>().state.productModel;
    final soldQuantity = context.watch<BestSellerCubit>().state.soldQuantity;
    final totalIncome = context.watch<BestSellerCubit>().state.totalIncome;

    if (productModel != null && soldQuantity != null && totalIncome != null) {
      return Card(
        margin: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Producto Mejor Vendido:',
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$productModel - $soldQuantity unidades',
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                children: [
                  Text(
                    'Ingresos generados: $totalIncome Bs.',
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
    return const SizedBox();
  }
}
