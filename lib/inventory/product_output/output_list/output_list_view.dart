import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'output_list_bloc.dart';
import 'output_list_event.dart';

class OutputListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => OutputListBloc()..add(InitEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<OutputListBloc>(context);

    return Container();
  }
}

