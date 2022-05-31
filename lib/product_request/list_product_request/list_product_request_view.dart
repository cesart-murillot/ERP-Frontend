import 'package:erp_fronted/product_request/models/transfer_model.dart';
import 'package:erp_fronted/product_request/request_product/request_product_view.dart';
import 'package:erp_fronted/product_request/verify_product_request/verify_product_request_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'list_product_request_bloc.dart';
import 'list_product_request_event.dart';
import 'list_product_request_state.dart';

class ListProductRequestPage extends StatelessWidget {
  const ListProductRequestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          ListProductRequestBloc()..add(InitEvent()),
      child: Builder(
        builder: (context) => Scaffold(
          body: const StateViews(),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RequestProductPage(),
                ),
              );

              if (result != null) {
                result ? context.read<ListProductRequestBloc>().add(InitEvent()) : print('Error from: list_product_request_view.dart');
              }
            },
            label: const Text('Generar Solicitud'),
          ),
        ),
      ),
    );
  }
}

class StateViews extends StatelessWidget {
  const StateViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListProductRequestBloc, ListProductRequestState>(
      builder: (context, state) {
        switch (state.state) {
          case States.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case States.loaded:
            if (state.transfers != null) {
              return ListProductRequest(
                transfers: state.transfers!,
              );
            }
            return const Center(
              child: Text('An error has occurred'),
            );
          case States.initial:
            return const Center(
              child: Text('Initial Statate'),
            );
          default:
            return const Center(
              child: Text('An error has Occurred'),
            );
        }
      },
    );
  }
}

class ListProductRequest extends StatelessWidget {
  const ListProductRequest({Key? key, required this.transfers})
      : super(key: key);
  final Transfers transfers;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: transfers.transfers.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
              'Sucursal: ${transfers.transfers[index].branch?.nameBranch}'),
          subtitle: Text(
              'Direccion: ${transfers.transfers[index].branch?.addressBranch}'),
          isThreeLine: true,
          trailing: transfers.transfers[index].verified!
              ? Wrap(
                  children: const [
                    Chip(
                      backgroundColor: Colors.green,
                      avatar: Icon(Icons.check),
                      label: Text('Verificado'),
                    ),
                  ],
                )
              : Wrap(
                  children: const [
                    Chip(
                      backgroundColor: Colors.yellow,
                      avatar: Icon(Icons.hourglass_bottom),
                      label: Text('Pendiente'),
                    ),
                  ],
                ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VerifyProductRequestPage(transferId: transfers.transfers[index].id!),
              ),
            );
          },
        );
      },
    );
  }
}
