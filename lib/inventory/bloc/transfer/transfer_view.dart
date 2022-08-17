import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'transfer_bloc.dart';
import 'transfer_event.dart';

class TransferPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TransferBloc()..add(InitEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<TransferBloc>(context);

    return Container();
  }
}

