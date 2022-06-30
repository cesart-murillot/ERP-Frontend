import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dash_board_bloc.dart';
import 'dash_board_event.dart';
import 'dash_board_state.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => DashBoardBloc()..add(InitEvent()),
      child: const StateViews(),
    );
  }
}

class StateViews extends StatelessWidget {
  const StateViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashBoardBloc, DashBoardState>(
      builder: (context, state) {
        switch (state.state) {
          case States.initial:
            return Container();
            break;
          case States.loading:
            return Container();
            break;
          case States.loaded:
            return const DashBoard();
            break;
          case States.error:
            return Container();
            break;
        }
      },
    );
  }
}

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final exampleData = context.watch<DashBoardBloc>().state.exampleData;
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: double.infinity,
                  child: Card(
                    child: charts.BarChart(exampleData!),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: SizedBox(
                  width: double.infinity,
                  child: Card(
                    color: Colors.white,
                    child: charts.BarChart(exampleData),
                  ),
                ),
              ),
              const Expanded(
                flex: 3,
                child: SizedBox(
                  width: double.infinity,
                  child: Card(
                    color: Colors.white,
                    child: SaleData(),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: const [
              Expanded(
                flex: 3,
                child: SizedBox(
                  width: double.infinity,
                  child: Card(
                    color: Colors.deepOrangeAccent,
                    child: Text('1'),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: SizedBox(
                  width: double.infinity,
                  child: Card(
                    color: Colors.lightBlueAccent,
                    child: Text('2'),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: double.infinity,
                  child: Card(
                    color: Colors.white30,
                    child: Text('3'),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class SaleData extends StatelessWidget {
  const SaleData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = context.watch<DashBoardBloc>().state.saleData;
    if (data != null) {
      return Column(
        children: [
          Flexible(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: const [
                        Text('Ingresos hoy:'),
                      ],
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${data['today'][0]} Bs.',
                          style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    Row(
                      children: [
                        Text(
                          'Número de Ventas: ${data['today'][1]}',
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: const [
                        Text('Ingresos este mes:'),
                      ],
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${data['month'][0]} Bs.',
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    Row(
                      children: [
                        Text(
                          'Número de Ventas: ${data['month'][1]}',
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: const [
                        Text('Ingresos este año:'),
                      ],
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${data['year'][0]} Bs.',
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    Row(
                      children: [
                        Text(
                          'Número de Ventas: ${data['year'][1]}',
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }
    return const SizedBox();
  }
}
