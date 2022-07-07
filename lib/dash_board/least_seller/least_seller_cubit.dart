import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:erp_fronted/src/resources/get_object.dart';

import 'least_seller_state.dart';

class LeastSellerCubit extends Cubit<LeastSellerState> {
  LeastSellerCubit() : super(const LeastSellerState().init());

  Future<void> leastSellerThisYear() async {
    emit(state.loadedData(state: States.loading));
    final url = preDefinedUri('/api/productSales/leastSeller/');

    try {
      final response = await fetchDataFromApi(url);
      final leastSeller = jsonDecode(response);
      emit(state.loadedData(
        state: States.loaded,
        totalIncome: leastSeller['totalIncome'],
        productModel: leastSeller['productModel'],
        soldQuantity: leastSeller['soldQuantity'],
      ));
    } catch (e) {
      emit(state.error(errorMessage: e.toString()));
    }
  }
}
