import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dash_board_bloc.dart';
import 'dash_board_event.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => DashBoardBloc()..add(InitEvent()),
      child: const DashBoard(),
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
