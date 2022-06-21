import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'dash_board_bloc.dart';
import 'dash_board_event.dart';
import 'dash_board_state.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
      DashBoardBloc()
        ..add(InitEvent()),
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
        switch (state.state)
        {
          case States.initial:
            return Container();
            break;
          case States.loading:
            return Container();
            break;
          case States.loaded:
            print('data');
            print(state.exampleData?.first);
            return charts.BarChart(state.exampleData!);
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
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            children: const [
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: double.infinity,
                  child: Card(
                    color: Colors.deepPurpleAccent,
                    child: Text('1'),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: SizedBox(
                  width: double.infinity,
                  child: Card(
                    color: Colors.indigoAccent,
                    child: Text('2'),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: SizedBox(
                  width: double.infinity,
                  child: Card(
                    color: Colors.pinkAccent,
                    child: Text('3'),
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
