import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:erp_fronted/src/resources/get_object.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'total_income_state.dart';

class TotalIncomeCubit extends Cubit<TotalIncomeState> {
  TotalIncomeCubit() : super(const TotalIncomeState().init());

  Future<void> getTotalIncome() async {
    emit(state.loadedData(state: States.loading));
    final prefs = await SharedPreferences.getInstance();
    final branchId = prefs.get('branchId');
    final urlSale = preDefinedUri('/api/salesMonth/$branchId', {'from': 'all'});

    final List<LinearSales> ordinalSales = [];

    try {
      final response = await fetchDataFromApi(urlSale);
      final sales = jsonDecode(response);
      for (final saleByMonthDatum in sales) {
        //print(saleByMonthDatum);
        if (saleByMonthDatum['sales'] is String){
          ordinalSales.add(LinearSales(saleByMonthDatum['month'], double.parse(saleByMonthDatum['sales'])));
        }
      }

      final value = charts.Series<LinearSales, int>(
        id: 'Sales',
        colorFn: (_,__) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.month,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: ordinalSales,
      );

      List<charts.Series<LinearSales, int>> listData = [];

      listData.add(value);

      emit(state.loadedData(
        state: States.loaded,
        seriesList: listData,
      ));
    } catch (e) {
      emit(state.error(errorMessage: e.toString()));
    }
  }
}

class OrdinalSales {
  final int month;
  final double sales;

  OrdinalSales(this.month, this.sales);
}

class LinearSales {
  final int month;
  final double sales;

  LinearSales(this.month, this.sales);
}