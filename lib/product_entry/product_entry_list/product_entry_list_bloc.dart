import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:erp_fronted/product_entry/models/product_entry_model.dart';

import '../../src/resources/get_object.dart';
import 'product_entry_list_event.dart';
import 'product_entry_list_state.dart';

class ProductEntryListBloc extends Bloc<ProductEntryListEvent, ProductEntryListState> {
  ProductEntryListBloc() : super(const InitialState()) {

    on<GetProductEntryEvent>(_getProductEntry);
    on<ShowProductEntryEvent>(_showProductEntry);
  }


  FutureOr<void> _getProductEntry(GetProductEntryEvent event, Emitter<ProductEntryListState> emit) async {
    emit(const LoadingProductEntriesState());
    final url = preDefinedUri('api/product_entries', {'verified': 'true'});
    ProductEntries productEntries = await getObject(url, ProductEntries.serializer);
    print(productEntries);
    emit(LoadedProductEntriesState(productEntries));
  }

  FutureOr<void> _showProductEntry(ShowProductEntryEvent event, Emitter<ProductEntryListState> emit) {

  }
}
