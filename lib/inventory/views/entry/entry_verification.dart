import 'package:erp_fronted/inventory/bloc/entry/entry_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/entry_model.dart';

class EntryVerification extends StatelessWidget {
  EntryVerification({Key? key , required this.entry
      })
      : super(key: key);
  final _entryVerificationFormKey = GlobalKey<FormState>();

  final Entry entry;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => EntryVerificationBloc()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Verificación de Entrada'),
          actions: [
            IconButton(
              tooltip: 'Registrar',
              onPressed: () {
                _entryVerificationFormKey.currentState?.save();
              },
              icon: const Icon(Icons.save),
            )
          ],
        ),
        body: Form(
          key: _entryVerificationFormKey,
          child: Card(
            margin: const EdgeInsets.all(16.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Producto: ',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      Text(entry.product!.modelProduct),
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Fecha de registro: ',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      Text(entry.createdAt.toString()),
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Cantidad registrada: ',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      Text(entry.quantityEntry.toString()),
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const LossRegistration(),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const ErrorRegistration(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LossRegistration extends StatelessWidget {
  const LossRegistration({Key? key}) : super(key: key);
  final int availableUnits = 10;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EntryVerificationAdditionalInfoCubit>(
          create: (_) => EntryVerificationAdditionalInfoCubit(),
        ),
        BlocProvider<EntryVerificationCalculateLosses>(
          create: (_) => EntryVerificationCalculateLosses(),
        ),
      ],
      child: BlocBuilder<EntryVerificationAdditionalInfoCubit, bool>(
        builder: (context, showAddInfo) {
          if (!showAddInfo) {
            return TextButton(
              onPressed: () {
                context
                    .read<EntryVerificationAdditionalInfoCubit>()
                    .showAdditionalInfo();
                context.read<EntryVerificationCalculateLosses>().initValues(availableUnits);
              },
              child: const Align(
                  alignment: Alignment.centerRight,
                  child: Text('Registar Mermas')),
            );
          }
          if (showAddInfo) {
            return Column(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      context
                          .read<EntryVerificationAdditionalInfoCubit>()
                          .hideAdditionalInfo();
                    },
                    child: const Text('Ocualtar Información Adicional'),
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        onChanged: (value) {
                          if (value.isEmpty) {
                            value = '0';
                          }
                          BlocProvider.of<EntryVerificationCalculateLosses>(
                                  context)
                              .deduceLosses([availableUnits, int.parse(value)]);
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: const InputDecoration(
                          labelText: 'Número de unidades dañadas',
                        ),
                        onSaved: (value) {
                          context.read<EntryVerificationBloc>().add(EntryVerificationEventSaveInformation({'damage': int.parse(value!)}));
                        },
                      ),
                    ),
                    const Text('Restante: '),
                    BlocBuilder<EntryVerificationCalculateLosses, int>(
                      builder: (context, state) {
                        return Text(state.toString());
                      },
                    )
                  ],
                ),
                TextFormField(
                  onSaved: (value) {
                    context.read<EntryVerificationBloc>().add(
                        EntryVerificationEventSaveInformation(
                            {'addInfo': value}));
                  },
                  decoration:
                      const InputDecoration(labelText: 'Información Adicional'),
                )
              ],
            );
          }
          return const Text('Error');
        },
      ),
    );
  }
}

class ErrorRegistration extends StatelessWidget {
  const ErrorRegistration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EntryVerificationAdditionalInfoCubit(),
      child: BlocBuilder<EntryVerificationAdditionalInfoCubit, bool>(
        builder: (context, showAddInfo) {
          if (!showAddInfo) {
            return Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  context
                      .read<EntryVerificationAdditionalInfoCubit>()
                      .showAdditionalInfo();
                },
                child: const Text('Reportar Error'),
              ),
            );
          }
          if (showAddInfo) {
            return Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      context
                          .read<EntryVerificationAdditionalInfoCubit>()
                          .hideAdditionalInfo();
                    },
                    child: const Text('Ocultar Informacion Adicional'),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Descripción del Error',
                  ),
                  onSaved: (value) {
                    context.read<EntryVerificationBloc>().add(
                        EntryVerificationEventSaveInformation(
                            {'error': value}));
                  },
                )
              ],
            );
          }
          return const Text('error');
        },
      ),
    );
  }
}
