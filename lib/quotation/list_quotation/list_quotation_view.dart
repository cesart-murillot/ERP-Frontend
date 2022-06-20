import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'list_quotation_bloc.dart';
import 'list_quotation_event.dart';
import 'list_quotation_state.dart';

class ListQuotationPage extends StatelessWidget {
  const ListQuotationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ListQuotationBloc()..add(InitEvent()),
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
    return BlocBuilder<ListQuotationBloc, ListQuotationState>(
      builder: (context, state) {
        return Container();
      },
    );
  }
}
