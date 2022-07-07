import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:erp_fronted/src/resources/get_object.dart';

import 'best_seller_state.dart';

class BestSellerCubit extends Cubit<BestSellerState> {
  BestSellerCubit() : super(const BestSellerState().init());

  Future<void> bestSellerThisYear() async {
    emit(state.loadedData(state: States.loading));
    final url = preDefinedUri('/api/productSales/bestSeller/');

    try {
      final response = await fetchDataFromApi(url);
      final bestSeller = jsonDecode(response);

      emit(state.loadedData(
        state: States.loaded,
        totalIncome: bestSeller['totalIncome'],
        productModel: bestSeller['productModel'],
        soldQuantity: bestSeller['soldQuantity'],
      ));
    } catch (e) {
      emit(state.error(errorMessage: e.toString()));
    }
  }
}
