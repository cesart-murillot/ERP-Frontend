import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:erp_fronted/src/resources/get_object.dart';

import 'total_quotation_state.dart';

class TotalQuotationCubit extends Cubit<TotalQuotationState> {
  TotalQuotationCubit() : super(const TotalQuotationState().init());

  Future<void> getNumberOfQuotationsToday() async {
    emit(state.loadedData(state: States.loading));
    final url =
        preDefinedUri('/api/productSales/totalQuotation/', {'period': 'today'});
    try {
      final response = await fetchDataFromApi(url);
      final numberOfQuotations = jsonDecode(response);
      emit(state.loadedData(
        state: States.loaded,
        numberOfQuotations: numberOfQuotations['numberOfQuotations'],
        valueOfQuotations: numberOfQuotations['valueOfQuotations'],
      ));
    } catch (e) {
      emit(state.error(errorMessage: e.toString()));
    }
  }

  Future<void> getNumberOfQuotationsThisMonth() async {
    emit(state.loadedData(state: States.loading));
    final url = preDefinedUri(
        '/api/productSales/totalQuotation/', {'period': 'thisMonth'});
    try {
      final response = await fetchDataFromApi(url);
      final numberOfQuotations = jsonDecode(response);
      emit(state.loadedData(
        state: States.loaded,
        numberOfQuotations: numberOfQuotations['numberOfQuotations'],
        valueOfQuotations: numberOfQuotations['valueOfQuotations'],
      ));
    } catch (e) {
      emit(state.error(errorMessage: e.toString()));
    }
  }

  Future<void> getNumberOfQuotationsThisYear() async {
    emit(state.loadedData(state: States.loading));
    final url = preDefinedUri(
        '/api/productSales/totalQuotation/', {'period': 'thisYear'});
    try {
      final response = await fetchDataFromApi(url);
      final numberOfQuotations = jsonDecode(response);
      emit(state.loadedData(
        state: States.loaded,
        numberOfQuotations: numberOfQuotations['numberOfQuotations'],
        valueOfQuotations: numberOfQuotations['valueOfQuotations'],
      ));
    } catch (e) {
      emit(state.error(errorMessage: e.toString()));
    }
  }
}
