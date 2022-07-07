import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'generate_sale_bloc.dart';
import 'generate_sale_event.dart';
import 'generate_sale_state.dart';

class GenerateSalePage extends StatelessWidget {
  const GenerateSalePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
      GenerateSaleBloc()
        ..add(InitEvent()),
      child: Builder(builder: (context) => const StateViews()),
    );
  }
}

class StateViews extends StatelessWidget {
  const StateViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenerateSaleBloc, GenerateSaleState>(
      builder: (context, state) {
        return const GenerateSale();
      },
    );
  }
}

class GenerateSale extends StatelessWidget {
  const GenerateSale({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


