import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:erp_fronted/entry_order/models/entry_order_model.dart';
import 'package:erp_fronted/src/resources/generic_serializer.dart';
import 'package:erp_fronted/src/resources/api_provider.dart';
import 'package:erp_fronted/src/resources/repository.dart';

import 'verify_entry_order_event.dart';
import 'verify_entry_order_state.dart';

class VerifyEntryOrderBloc extends Bloc<VerifyEntryOrderEvent, VerifyEntryOrderState> {
  final Repository repository;
  VerifyEntryOrderBloc(this.repository) : super(const InitState()) {
    on<InitEvent>(_init);
    on<GetEntryOrderEvent>(_getEntryOrderEvent);

  }

  void _init(InitEvent event, Emitter<VerifyEntryOrderState> emit) async {
    print('hello from bloc');
  }

  Future<FutureOr<void>> _getEntryOrderEvent(GetEntryOrderEvent event, Emitter<VerifyEntryOrderState> emit) async {
    final String entryOrderString = await repository.fetchData(UnEncodePath.entryorders, event.id.toString());
    final EntryOrder entryOrder = parseObject(entryOrderString, EntryOrder.serializer);

    emit(LoadedEntryOrder(entryOrder));
  }
}
