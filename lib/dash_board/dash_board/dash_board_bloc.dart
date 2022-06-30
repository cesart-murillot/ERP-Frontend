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
    final response = await get(urlSale);

    final saleData = jsonDecode(response.body);

    final urlSaleByMonth = preDefinedUri('/api/salesMonth/$branchId');
    final responseSaleByMonth = await get(urlSaleByMonth);
    final saleByMonthData = jsonDecode(responseSaleByMonth.body);

    final List<OrdinalSales> ordinalSales = [];

    for (final saleByMonthDatum in saleByMonthData) {
      //print(saleByMonthDatum);
      if (saleByMonthDatum['sales'] is String){
        ordinalSales.add(OrdinalSales(saleByMonthDatum['month'].toString(), double.parse(saleByMonthDatum['sales'])));
      }
    }

    final value = charts.Series<OrdinalSales, String>(
      id: 'Sales',
      colorFn: (_,__) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (OrdinalSales sales, _) => sales.month,
      measureFn: (OrdinalSales sales, _) => sales.sales,
      data: ordinalSales,
    );

    final value2 = charts.Series<OrdinalSales, String>(
      id: 'Sales',
      colorFn: (_,__) => charts.MaterialPalette.red.shadeDefault,
      domainFn: (OrdinalSales sales, _) => sales.month,
      measureFn: (OrdinalSales sales, _) => sales.sales,
      data: ordinalSales,
    );

    List<charts.Series<OrdinalSales, String>> listData = [];
    listData.add(value);
    //listData.add(value2);
    print(value.data);
    emit(state.loadedData(state: States.loaded, exampleData: listData, saleData: saleData));
  }
}

class OrdinalSales {
  final String month;
  final double sales;

  OrdinalSales(this.month, this.sales);
}