import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'invoice_list_bloc.dart';
import 'invoice_list_event.dart';
import 'invoice_list_state.dart';

class InvoiceListPage extends StatelessWidget {
  const InvoiceListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => InvoiceListBloc()..add(InitEvent()),
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
    return BlocBuilder<InvoiceListBloc, InvoiceListState>(
      builder: (context, state) {
        switch (state.state) {
          case States.initial:
            return const Center(
              child: Text(
                'Initial State',
              ),
            );
          case States.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case States.loaded:
            return const InvoiceList();
          case States.error:
            return Center(
              child: Text(
                state.errorMessage,
              ),
            );
        }
      },
    );
  }
}

class InvoiceList extends StatelessWidget {
  const InvoiceList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
