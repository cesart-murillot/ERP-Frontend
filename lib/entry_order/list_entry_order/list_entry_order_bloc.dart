import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:erp_fronted/entry_order/models/entry_order_model.dart';
import 'package:erp_fronted/src/resources/generic_serializer.dart';
import 'package:erp_fronted/src/resources/api_provider.dart';
import 'package:erp_fronted/src/resources/repository.dart';

import 'list_entry_order_event.dart';
import 'list_entry_order_state.dart';

class ListEntryOrderBloc extends Bloc<ListEntryOrderEvent, ListEntryOrderState> {
  final Repository repository;
  ListEntryOrderBloc(this.repository) : super(const InitState()) {
    on<InitEvent>(_init);
    on<FetchList>(_fetchList);
  }

  void _init(InitEvent event, Emitter<ListEntryOrderState> emit) async {

  }

  Future<FutureOr<void>> _fetchList(FetchList event, Emitter<ListEntryOrderState> emit) async {
    emit(const FetchingListState());
    try {
      final String entryOrdersString = await repository.fetchData(UnEncodePath.entryorders);
      final EntryOrders entryOrders = parseObject(entryOrdersString, EntryOrders.serializer);
      emit(LoadedListState(entryOrders));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
