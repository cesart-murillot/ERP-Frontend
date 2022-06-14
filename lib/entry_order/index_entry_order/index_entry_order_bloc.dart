import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:erp_fronted/src/resources/get_object.dart';
import 'package:erp_fronted/entry_order/models/entry_order_model.dart';

import 'index_entry_order_event.dart';
import 'index_entry_order_state.dart';

class IndexEntryOrderBloc extends Bloc<IndexEntryOrderEvent, IndexEntryOrderState> {
  IndexEntryOrderBloc() : super(const IndexEntryOrderState().init()) {
    on<InitEvent>(_init);
    on<ReloadEvent>(_reload);
  }

  void _init(InitEvent event, Emitter<IndexEntryOrderState> emit) async {
    emit(state.loaded(state: States.loading));
    
    final url = preDefinedUri('/api/entryorders/');
    try {
      final EntryOrders entryOrders = await getObject(url, EntryOrders.serializer);
      emit(state.loaded(state: States.loadedAll, entryOrders: entryOrders));
    } catch (e) {
      emit(state.error(errorString: e.toString()));
    }
  }

  FutureOr<void> _reload(ReloadEvent event, Emitter<IndexEntryOrderState> emit) {
    add(InitEvent());
  }
}
