import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'total_income_cubit.dart';
import 'total_income_state.dart';

class TotalIncomePage extends StatelessWidget {
  const TotalIncomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TotalIncomeCubit()..getTotalIncome(),
      child: Builder(builder: (context) => const StateViews()),
    );
  }
}

class StateViews extends StatelessWidget {
  const StateViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TotalIncomeCubit, TotalIncomeState>(
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
              child: TotalIncome(),
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

class TotalIncome extends StatelessWidget {
  const TotalIncome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final exampleData = context.watch<TotalIncomeCubit>().state.seriesList;

    return Column(
      children: [
        Row(
          children: const [
            Text('Total Ingresos por Mes (en Bs.): ')
          ],
        ),
        const SizedBox(
          height: 8.0,
        ),
        Flexible(
          child: charts.LineChart(
            exampleData!,
            animate: true,
            defaultRenderer: charts.LineRendererConfig(
              includePoints: true,
              includeArea: true,
            ),
            primaryMeasureAxis: const charts.NumericAxisSpec(showAxisLine: true),
          ),
        ),
      ],
    );
  }
}
