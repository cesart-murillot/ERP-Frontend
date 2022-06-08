import 'package:bloc/bloc.dart';
import 'package:erp_fronted/product_entry/models/product_entry_model.dart';
import 'package:erp_fronted/src/resources/get_object.dart';

import 'verify_product_entry_event.dart';
import 'verify_product_entry_state.dart';

class VerifyProductEntryBloc extends Bloc<VerifyProductEntryEvent, VerifyProductEntryState> {
  VerifyProductEntryBloc() : super(const VerifyProductEntryState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<VerifyProductEntryState> emit) async {
    emit(state.loadedData(state: States.loading));
    final url = preDefinedUri('/api/product_entries/${event.productEntryId}');
    try {
      final ProductEntry productEntry = await getObject(url, ProductEntry.serializer);
      emit(state.loadedData(state: States.loaded, productEntry: productEntry));
    } catch (e) {
      emit(state.error(errorMessage: e.toString()));
    }
  }
}
