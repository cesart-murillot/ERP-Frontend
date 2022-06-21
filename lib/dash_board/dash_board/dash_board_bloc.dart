import 'package:bloc/bloc.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'dash_board_event.dart';
import 'dash_board_state.dart';

class DashBoardBloc extends Bloc<DashBoardEvent, DashBoardState> {
  DashBoardBloc() : super(const DashBoardState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<DashBoardState> emit) async {
    emit(state.loadedData(state: States.loading));
    List<charts.Series<dynamic, String>> exampleData = [];

    final List<OrdinalSales> ordinalSales = [
    OrdinalSales('2001', 100),
    OrdinalSales('2002', 100),
    OrdinalSales('2003', 100),
    ];

    final value = charts.Series<OrdinalSales, String>(
      id: 'Sales',
      colorFn: (_,__) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (OrdinalSales sales, _) => sales.year,
      measureFn: (OrdinalSales sales, _) => sales.sales,
      data: ordinalSales,
    );

    final value2 = charts.Series<OrdinalSales, String>(
      id: 'Sales',
      colorFn: (_,__) => charts.MaterialPalette.red.shadeDefault,
      domainFn: (OrdinalSales sales, _) => sales.year,
      measureFn: (OrdinalSales sales, _) => sales.sales,
      data: ordinalSales,
    );

    List<charts.Series<OrdinalSales, String>> listData = [];
    listData.add(value);
    listData.add(value2);
    //print(value.data);
    emit(state.loadedData(state: States.loaded, exampleData: listData));
  }
}

class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}