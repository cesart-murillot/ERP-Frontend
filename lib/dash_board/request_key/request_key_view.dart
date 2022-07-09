import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'request_key_cubit.dart';
import 'request_key_state.dart';

class RequestKeyPage extends StatelessWidget {
  const RequestKeyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RequestKeyCubit()..totalTransfers(),
      child: Builder(builder: (context) => const StateViews()),
    );
  }
}

class StateViews extends StatelessWidget {
  const StateViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestKeyCubit, RequestKeyState>(
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
            return const RequestKey();
          case States.error:
            return Center(
              child: Text(
                '${state.errorMessage}',
              ),
            );
        }
      },
    );
  }
}

class RequestKey extends StatelessWidget {
  const RequestKey({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final totalTransfers =
        context.read<RequestKeyCubit>().state.totalTransfers ?? 0;
    final verifiedTransfers =
        context.read<RequestKeyCubit>().state.verifiedTransfers ?? 0;
    final pendingTransfers =
        context.read<RequestKeyCubit>().state.pendingTransfers ?? 0;
    final verifiedRatio = (verifiedTransfers / totalTransfers) * 100;
    final String stringVerifiedRatio = verifiedRatio.toStringAsFixed(2);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Wrap(
              children: [
                Row(
                  children: [
                    Text(
                      'Pedidos Verificados:',
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.request_page,
                  color: verifiedRatio > 80
                      ? Colors.green
                      : verifiedRatio > 50
                          ? Colors.yellow
                          : Colors.pinkAccent,
                ),
                Text(
                  '$stringVerifiedRatio %',
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.headlineSmall,
                    color: verifiedRatio > 80
                        ? Colors.green
                        : verifiedRatio > 50
                            ? Colors.yellow
                            : Colors.pinkAccent,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  '$pendingTransfers por verificar',
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
