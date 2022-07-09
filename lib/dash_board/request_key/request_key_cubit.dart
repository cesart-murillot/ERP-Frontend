import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:erp_fronted/src/resources/get_object.dart';

import 'request_key_state.dart';

class RequestKeyCubit extends Cubit<RequestKeyState> {
  RequestKeyCubit() : super(const RequestKeyState().init());

  Future<void> totalTransfers() async {
    emit(state.loadedData(state: States.loading));
    final url = preDefinedUri('/api/transfers/totalTransfers/');

    try {
      final response = await fetchDataFromApi(url);
      final transfersData = jsonDecode(response);

      emit(state.loadedData(
        state: States.loaded,
        totalTransfers: transfersData['totalTransfers'],
        verifiedTransfers: transfersData['verifiedTransfers'],
        pendingTransfers: transfersData['pendingTransfers'],
      ));
    } catch (e) {
      emit(state.error(errorMessage: e.toString()));
    }
  }
}
