import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:erp_fronted/product_entry/models/product_entry_model.dart';
import 'package:erp_fronted/src/resources/get_object.dart';

import 'index_product_entry_event.dart';
import 'index_product_entry_state.dart';

class IndexProductEntryBloc extends Bloc<IndexProductEntryEvent, IndexProductEntryState> {
  IndexProductEntryBloc() : super(const IndexProductEntryState().init()) {
    on<InitEvent>(_init);
    on<ReloadEvent>(_reload);
  }

  void _init(InitEvent event, Emitter<IndexProductEntryState> emit) async {
    emit(state.loadedData(state: States.loading));
    final url = preDefinedUri('/api/product_entries/', {'verified': 'true'});
    try {
      ProductEntries productEntries = await getObject(url, ProductEntries.serializer);
      emit(state.loadedData(state: States.loaded, productEntries: productEntries));
    } catch (e) {
      emit(state.error(errorString: e.toString()));
    }

  }

  FutureOr<void> _reload(ReloadEvent event, Emitter<IndexProductEntryState> emit) {
    add(InitEvent());
  }
}
