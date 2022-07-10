import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:erp_fronted/src/resources/get_object.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dash_board_event.dart';
import 'dash_board_state.dart';

class DashBoardBloc extends Bloc<DashBoardEvent, DashBoardState> {
  DashBoardBloc() : super(const DashBoardState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<DashBoardState> emit) async {
    emit(state.loadedData(state: States.loading));
    final prefs = await SharedPreferences.getInstance();
    final branchId = prefs.get('branchId');

    final urlSale = preDefinedUri('/api/dateSales/$branchId');


    final data = await fetchDataFromApi(urlSale);
    final saleData = jsonDecode(data);

    emit(state.loadedData(state: States.loaded, saleData: saleData));
  }
}

class OrdinalSales {
  final String month;
  final double sales;

  OrdinalSales(this.month, this.sales);
}