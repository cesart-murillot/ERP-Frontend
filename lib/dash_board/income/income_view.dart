import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'income_cubit.dart';
import 'income_state.dart';

class IncomePage extends StatelessWidget {
  const IncomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => IncomeCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<IncomeCubit>(context);

    return Container();
  }
}


