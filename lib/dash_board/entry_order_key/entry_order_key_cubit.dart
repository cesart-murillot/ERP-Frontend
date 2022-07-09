import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:erp_fronted/src/resources/get_object.dart';

import 'entry_order_key_state.dart';

class EntryOrderKeyCubit extends Cubit<EntryOrderKeyState> {
  EntryOrderKeyCubit() : super(const EntryOrderKeyState().init());

  Future<void> totalEntryOrder() async {
    emit(state.loadedData(state: States.loading));
    final url = preDefinedUri('/api/totalEntryOrders/');

    try {
      final response = await fetchDataFromApi(url);
      final entryOrderData = jsonDecode(response);
      print(entryOrderData);
      emit(state.loadedData(
        state: States.loaded,
        totalEntryOrders: entryOrderData['totalEntryOrders'],
        verifiedEntryOrders: entryOrderData['verifiedEntryOrders'],
        errorEntryOrders: entryOrderData['errorEntryOrders'],
        todayEntryOrders: entryOrderData['todayEntryOrders'],
      ));
    } catch (e) {
      emit(state.error(errorMessage: e.toString()));
    }
  }
}
