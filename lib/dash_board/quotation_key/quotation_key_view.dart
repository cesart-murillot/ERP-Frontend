import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'quotation_key_cubit.dart';
import 'quotation_key_state.dart';

class QuotationKeyPage extends StatelessWidget {
  const QuotationKeyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => QuotationKeyCubit()..quotationData(),
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
    return BlocBuilder<QuotationKeyCubit, QuotationKeyState>(
      builder: (context, state) {
        switch (state.state) {
          case States.initial:
            return const Center(
              child: Text(
                'Initial State',
              ),
            );
            break;
          case States.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
            break;
          case States.loaded:
            return const QuotationKey();
            break;
          case States.error:
            return Center(
              child: Text(
                '${state.errorMessage}',
              ),
            );
            break;
        }
      },
    );
  }
}

class QuotationKey extends StatelessWidget {
  const QuotationKey({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final totalQuotations =
        context.read<QuotationKeyCubit>().state.totalQuotations ?? 0;
    final totalSales = context.read<QuotationKeyCubit>().state.totalSales ?? 0;
    final salesWithQuotations =
        context.read<QuotationKeyCubit>().state.salesWithQuotations ?? 0;
    final ratioQuotationsSales =
        context.read<QuotationKeyCubit>().state.ratioQuotationsSales ?? 0;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Wrap(
              children: [
                Row(
                  children: [
                    Text(
                      'Cotizaciones => Ventas:',
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.newspaper,
                  color: ratioQuotationsSales > 80
                      ? Colors.green
                      : ratioQuotationsSales > 50
                          ? Colors.yellow
                          : Colors.pinkAccent,
                ),
                Text(
                  '$ratioQuotationsSales %',
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.headlineSmall,
                    color: ratioQuotationsSales > 80
                        ? Colors.green
                        : ratioQuotationsSales > 50
                            ? Colors.yellow
                            : Colors.pinkAccent,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  '$salesWithQuotations cotizaciones - ventas',
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  '$totalQuotations cotizaciones',
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  '$totalSales ventas',
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
