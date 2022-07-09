import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:erp_fronted/src/resources/get_object.dart';

import 'quotation_key_state.dart';

class QuotationKeyCubit extends Cubit<QuotationKeyState> {
  QuotationKeyCubit() : super(const QuotationKeyState().init());

  Future<void> quotationData() async {
    emit(state.loadedData(state: States.loading));
    final url = preDefinedUri('/api/quotations/quotationData/');

    try {
      final response = await fetchDataFromApi(url);
      final quotationInformation = jsonDecode(response);

      emit(state.loadedData(
        state: States.loaded,
        totalQuotations: quotationInformation['totalQuotations'],
        totalSales: quotationInformation['totalSales'],
        salesWithQuotations: quotationInformation['salesWithQuotations'],
        ratioQuotationsSales: quotationInformation['ratioQuotationsSales'],
      ));
    } catch (e) {
      emit(state.error(errorMessage: e.toString()));
    }
  }

}
