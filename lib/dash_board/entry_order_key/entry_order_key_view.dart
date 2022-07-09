import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'entry_order_key_cubit.dart';
import 'entry_order_key_state.dart';

class EntryOrderKeyPage extends StatelessWidget {
  const EntryOrderKeyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => EntryOrderKeyCubit()..totalEntryOrder(),
      child: Builder(builder: (context) => const StateViews()),
    );
  }
}

class StateViews extends StatelessWidget {
  const StateViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EntryOrderKeyCubit, EntryOrderKeyState>(
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
            return const EntryOrderKey();
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

class EntryOrderKey extends StatelessWidget {
  const EntryOrderKey({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final totalEntryOrders =
        context.read<EntryOrderKeyCubit>().state.totalEntryOrders ?? 0;
    final verifiedEntryOrders =
        context.read<EntryOrderKeyCubit>().state.verifiedEntryOrders ?? 0;
    final errorEntryOrders =
        context.read<EntryOrderKeyCubit>().state.errorEntryOrders ?? 0;
    final todayEntryOrders =
        context.read<EntryOrderKeyCubit>().state.todayEntryOrders ?? 0;
    final double verifiedRatio = (verifiedEntryOrders / totalEntryOrders) * 100;
    final String stringVerifiedRatio = verifiedRatio.toStringAsFixed(2);
    final int remainEntryOrders = totalEntryOrders - verifiedEntryOrders;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Wrap(
              children: [
                Text(
                  'Ordenes de Ingreso Verificadas:',
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.input,
                  color: verifiedRatio > 80
                      ? Colors.green
                      : verifiedRatio > 50
                          ? Colors.deepOrange
                          : Colors.pinkAccent,
                ),
                Text(
                  '$stringVerifiedRatio %',
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.headlineSmall,
                    color: verifiedRatio > 80
                        ? Colors.green
                        : verifiedRatio > 50
                            ? Colors.deepOrange
                            : Colors.pinkAccent,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  '$remainEntryOrders por verificar',
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
