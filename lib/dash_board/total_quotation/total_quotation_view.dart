import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'total_quotation_cubit.dart';
import 'total_quotation_state.dart';

class TotalQuotationPage extends StatelessWidget {
  const TotalQuotationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          TotalQuotationCubit()..getNumberOfQuotationsToday(),
      child: Builder(builder: (context) => const StateViews()),
    );
  }
}

class StateViews extends StatelessWidget {
  const StateViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TotalQuotationCubit, TotalQuotationState>(
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
            return const TotalQuotation();
          case States.error:
            return Center(
              child: Text(
                '${state.errorMessage}',
              ),
            );
        }
        return Container();
      },
    );
  }
}

class TotalQuotation extends StatelessWidget {
  const TotalQuotation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final numberOfQuotations =
        context.watch<TotalQuotationCubit>().state.numberOfQuotations;
    final valueOfQuotations =
        context.watch<TotalQuotationCubit>().state.valueOfQuotations;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Wrap(
              runSpacing: 8.0,
              children: [
                SizedBox(
                  height: 24.0,
                  width: 48.0,
                  child: FittedBox(
                    child: ActionChip(
                      label: const Text('Año'),
                      onPressed: () {
                        context
                            .read<TotalQuotationCubit>()
                            .getNumberOfQuotationsThisYear();
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.0,
                  width: 48.0,
                  child: FittedBox(
                    child: ActionChip(
                      label: const Text('Mes'),
                      onPressed: () {
                        context
                            .read<TotalQuotationCubit>()
                            .getNumberOfQuotationsThisMonth();
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.0,
                  width: 48.0,
                  child: FittedBox(
                    child: ActionChip(
                      label: const Text('Hoy'),
                      onPressed: () {
                        context
                            .read<TotalQuotationCubit>()
                            .getNumberOfQuotationsToday();
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Cotizaciones Realizadas:',
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$numberOfQuotations',
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.headlineSmall,
                    color: numberOfQuotations < 5 ? Colors.pinkAccent : Colors.orange,
                  ),
                ),
              ],
            ),
            numberOfQuotations > 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          'Por un valor de: $valueOfQuotations Bs.',
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
