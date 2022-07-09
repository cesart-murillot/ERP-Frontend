import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'least_seller_cubit.dart';
import 'least_seller_state.dart';

class LeastSellerPage extends StatelessWidget {
  const LeastSellerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LeastSellerCubit()..leastSellerThisYear(),
      child: Builder(builder: (context) => const LeastSeller()),
    );
  }
}

class StateViews extends StatelessWidget {
  const StateViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeastSellerCubit, LeastSellerState>(
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
            return const LeastSeller();
            break;
          case States.error:
            return Container();
            break;
        }
      },
    );
  }
}

class LeastSeller extends StatelessWidget {
  const LeastSeller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productModel = context.watch<LeastSellerCubit>().state.productModel;
    final soldQuantity = context.watch<LeastSellerCubit>().state.soldQuantity;
    final totalIncome = context.watch<LeastSellerCubit>().state.totalIncome;

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
                    'Producto Menos Vendido:',
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
                      textStyle: Theme.of(context).textTheme.headlineSmall,
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
    return const SizedBox(child: Text('Error'),);
  }
}