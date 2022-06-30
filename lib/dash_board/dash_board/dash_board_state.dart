import 'package:charts_flutter/flutter.dart' as charts;
import 'package:equatable/equatable.dart';

enum States { initial, loading, loaded, error }

class DashBoardState extends Equatable {
  final States state;
  final List<Map<String, String>>? data;
  final List<charts.Series<dynamic, String>>? exampleData;
  final List<charts.Series>? seriesList;
  final Map<dynamic, dynamic>? saleData;
  DashBoardState init() {
    return const DashBoardState();
  }

  DashBoardState clone() {
    return const DashBoardState();
  }

  DashBoardState loadedData({
    required States state,
    List<Map<String, String>>? data,
    List<charts.Series>? seriesList,
    List<charts.Series<dynamic, String>>? exampleData,
    Map<dynamic, dynamic>? saleData,
  }) {
    return DashBoardState(
      state: state,
      data: data ?? this.data,
      seriesList: seriesList ?? this.seriesList,
      exampleData: exampleData ?? this.exampleData,
      saleData: saleData ?? this.saleData
    );
  }

  @override
  List<Object?> get props => [state, data, exampleData, seriesList, saleData];

  const DashBoardState({
    this.saleData,
    this.state = States.initial,
    this.data,
    this.exampleData,
    this.seriesList,
  });
}
