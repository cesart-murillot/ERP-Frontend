import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'generate_quotation_bloc.dart';
import 'generate_quotation_event.dart';
import 'generate_quotation_state.dart';

class GenerateQuotationPage extends StatelessWidget {
  const GenerateQuotationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          GenerateQuotationBloc()..add(InitEvent()),
      child: Builder(
        builder: (context) => Scaffold(
          body: const StateViews(),
          appBar: AppBar(),
        ),
      ),
    );
  }
}

class StateViews extends StatelessWidget {
  const StateViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenerateQuotationBloc, GenerateQuotationState>(
      builder: (context, state) {
        return Container();
      },
    );
  }
}
