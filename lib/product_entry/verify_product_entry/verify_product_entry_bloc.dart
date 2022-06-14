import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:erp_fronted/entry/models/entry_model.dart';
import 'package:erp_fronted/product_entry/models/product_entry_model.dart';
import 'package:erp_fronted/src/resources/generic_serializer.dart';
import 'package:erp_fronted/src/resources/get_object.dart';
import 'package:erp_fronted/src/resources/post_object.dart';

import 'verify_product_entry_event.dart';
import 'verify_product_entry_state.dart';

class VerifyProductEntryBloc extends Bloc<VerifyProductEntryEvent, VerifyProductEntryState> {
  VerifyProductEntryBloc() : super(const VerifyProductEntryState().init()) {
    on<InitEvent>(_init);
    on<SaveQuantityEvent>(_saveQuantity);
    on<SaveSectionIdEvent>(_saveSectionId);
    on<StoreDataEvent>(_storeData);
  }

  void _init(InitEvent event, Emitter<VerifyProductEntryState> emit) async {
    emit(state.loadedData(state: States.loading));
    final url = preDefinedUri('/api/product_entries/${event.productEntryId}');
    print(url);
    try {
      final ProductEntry productEntry = await getObject(url, ProductEntry.serializer);

      if (productEntry.verified!) {
        return emit(state.loadedData(state: States.verified, productEntry: productEntry));
      }
      return emit(state.loadedData(state: States.loaded, productEntry: productEntry));
    } catch (e) {
      emit(state.error(errorMessage: e.toString()));
    }
  }

  FutureOr<void> _saveQuantity(SaveQuantityEvent event, Emitter<VerifyProductEntryState> emit) {
    emit(state.loadedData(state: States.loaded, quantity: event.quantity));
  }



  FutureOr<void> _saveSectionId(SaveSectionIdEvent event, Emitter<VerifyProductEntryState> emit) {
    emit(state.loadedData(state: States.loaded, sectionId: event.sectionId));
  }


  FutureOr<void> _storeData(StoreDataEvent event, Emitter<VerifyProductEntryState> emit) {
    var entry = Entry((b) => b
      ..sectionId = state.sectionId
      ..entryOrderProductId = state.productEntry!.id
      ..productId = state.productEntry!.productId
      ..quantityEntry = state.quantity
      ..remainEntry = state.quantity);

    final String? entryString = objectToString(entry, Entry.serializer);
    
    final url = preDefinedUri('/api/product_entries/verify/${state.productEntry!.id}');
    try {
      final response = postDataToApi(url, entryString!);
      add(InitEvent(state.productEntry!.id!));
    } catch (e) {
      print(e);
    }
  }
}
