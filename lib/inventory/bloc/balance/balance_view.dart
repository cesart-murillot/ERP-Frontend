import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'balance_bloc.dart';
import 'balance_event.dart';

class BalancePage extends StatelessWidget {
  const BalancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => BalanceBloc()..add(InitEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<BalanceBloc>(context);

    return Container();
  }
}

