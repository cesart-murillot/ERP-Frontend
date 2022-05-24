import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_request_bloc.dart';
import 'product_request_event.dart';
import 'product_request_state.dart';

class ProductRequestPage extends StatelessWidget {
  const ProductRequestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ProductRequestBloc()..add(InitEvent()),
      child: Builder(builder: (context) => const ProductRequest()),
    );
  }

/*  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<ProductRequestBloc>(context);
    switch (bloc.state.state) {
      case CustomState.initialState:
        // TODO: Handle this case.
        break;
      case CustomState.loadingState:
        // TODO: Handle this case.
        break;
      case CustomState.loadedState:
        // TODO: Handle this case.
        break;
      default:
        return Text('error');
    }
  }*/
}

class ProductRequest extends StatelessWidget {
  const ProductRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductRequestBloc, ProductRequestState>(
      buildWhen: (previousState, state) {
        if (state.state == CustomState.loadedState) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        switch (state.state) {
          case CustomState.initialState:
            Future.delayed(const Duration(milliseconds: 40000),);
            return Text('Initial State');
          case CustomState.loadingState:
            return Text('Loading State');
          case CustomState.loadedState:
            return Text(state.products?.products[1].modelProduct ?? 'no data');
          default:
            return Text('error');
        }
      },
    );
  }
}
