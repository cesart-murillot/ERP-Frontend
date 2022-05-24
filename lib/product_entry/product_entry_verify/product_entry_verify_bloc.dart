import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:erp_fronted/product_entry/models/product_entry_model.dart';
import 'package:erp_fronted/src/resources/get_object.dart';

import 'product_entry_verify_event.dart';
import 'product_entry_verify_state.dart';

class ProductEntryVerifyBloc extends Bloc<ProductEntryVerifyEvent, ProductEntryVerifyState> {
  ProductEntryVerifyBloc() : super(const InitialState()) {
    on<InitEvent>(_init);
    on<GetProductEntryEvent>(_getProductEntry);
    on<VerifyProductEntry>(_verifyProductEnty);
    on<ConfirmProductEntryEvent>(_confirmProductEntry);
  }

  void _init(InitEvent event, Emitter<ProductEntryVerifyState> emit) async {
  }

  FutureOr<void> _getProductEntry(GetProductEntryEvent event, Emitter<ProductEntryVerifyState> emit) async {
    emit(const LoadingProductEntryState());
    final url = preDefinedUri('api/product_entries/'+event.productEntryId.toString());
    ProductEntry productEntry = await getObject(url, ProductEntry.serializer);
    emit(LoadedProductEntryState(productEntry));
  }

  FutureOr<void> _verifyProductEnty(VerifyProductEntry event, Emitter<ProductEntryVerifyState> emit) {
    emit(const ShowVerifyDialogState());
    emit(const InitialState());
  }

  FutureOr<void> _confirmProductEntry(ConfirmProductEntryEvent event, Emitter<ProductEntryVerifyState> emit) {
    print('hello from bloc');
    emit(const ConfirmDialogState());
  }
}
