import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:erp_fronted/inventory/models/entry_model.dart';
import 'package:erp_fronted/product/models/product_model.dart';
import 'package:erp_fronted/src/resources/generic_serializer.dart';
import 'package:erp_fronted/src/resources/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../src/resources/product_api_provider.dart';

part 'entry_event.dart';
part 'entry_state.dart';

class EntryBloc extends Bloc<EntryEvent, EntryState> {
  final Repository repository;

  EntryBloc(this.repository) : super(const EntryStateInitial()) {
    on<EntryEventInitial>(_initialEntryEvent);
  }

  Future<FutureOr<void>> _initialEntryEvent(EntryEventInitial event, Emitter<EntryState> emit) async {
    try {
      final String entriesString = await repository.fetchData(UnEncodePath.entries, '', {'with':'product'});
      final Entries entries = parseObject(entriesString, Entries.serializer);
      emit(EntryStateGetEntries(entries));
    } catch (e) {
      print(e);
    }
  }
}

class EntryProductCubit extends Cubit<Product?> {
  final Repository _repository;
  EntryProductCubit(this._repository) : super(null);

  Future<void> entryProductGet(int id) async {
    try {
      final String productString = await _repository.fetchData(UnEncodePath.products, id.toString(), {'with':'product'});
      final Product product = parseObject(productString, Product.serializer);
      //print(productString);
      emit(product);
    } catch (e) {
      print(e);
    }
  }
}

class EntryVerificationAdditionalInfoCubit extends Cubit<bool> {
  EntryVerificationAdditionalInfoCubit() : super(false);

  void showAdditionalInfo() => emit(true);
  void hideAdditionalInfo() => emit(false);
}

class EntryVerificationCalculateLosses extends Cubit<int> {
  EntryVerificationCalculateLosses() : super(0);

  void deduceLosses(List<int> values){
    if (values[0] < values[1])
      {
        return emit(0);
      }
    return emit(values[0] - values[1]);
  }

  void initValues(int initialValue) => emit(initialValue);
}

class EntryVerificationBloc extends Bloc<EntryVerificationEvent, EntryVerificationState> {

  EntryVerificationBloc() : super(const EntryVerificationStateInitial()){
    on<EntryVerificationEventSaveInformation>(_saveInformation);
  }

  FutureOr<void> _saveInformation(EntryVerificationEventSaveInformation event, Emitter<EntryVerificationState> emit) {
    print(event.entryVerificationData);
  }
}


