import 'package:built_value/built_value.dart';
import 'package:erp_fronted/inventory/bloc/entry/entry_bloc.dart';
import 'package:erp_fronted/main/navigator/bloc/navigator_bloc.dart';
import 'package:erp_fronted/src/resources/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EntryPage extends StatelessWidget {
  const EntryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: Icon(Icons.add),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<EntryBloc>(create: (_) => EntryBloc(Repository())..add(const EntryEventInitial())),
        ],
        child: EntryList(),
      ),
    );
  }
}

class EntryList extends StatelessWidget {
  const EntryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EntryBloc, EntryState>(
      builder: (context, state) {
        if (state is EntryStateGetEntries) {
          return ListView.builder(
            padding: EdgeInsets.all(16.0),
            itemCount: state.entries.entries.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  onTap: () {
                    context.read<NavigatorBloc>().add(NavigatorEventEntryVerification(state.entries.entries[index]));
                  },
                  contentPadding: EdgeInsets.all(16.0),
                  trailing: SizedBox(
                    width: 64.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        state.entries.entries[index].verifiedEntry ? const Icon(Icons.check) : const Icon(Icons.hourglass_bottom),
                        state.entries.entries[index].errorEntry ? const Icon(Icons.error) : const Icon(Icons.access_time)
                      ],
                    ),
                  ),
                  //title: Text(state.entries.entries[index].productId.toString()),
                  title: Text(state.entries.entries[index].product?.modelProduct ?? 'error'),
                  subtitle: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Wrap(
                          children: [
                            Text('Fecha: '),
                            Text(state.entries.entries[index].createdAt!)
                          ],
                        ),
                      ),

                      Row(
                        children: [
                          Text('Cantidad: '),
                          Text(state.entries.entries[index].quantityEntry.toString())
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }
        return Text('error');
      },
    );
  }
}
