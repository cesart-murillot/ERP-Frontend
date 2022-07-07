import 'package:charts_flutter/flutter.dart' as charts;
import 'package:equatable/equatable.dart';

enum States { initial, loading, loaded, error }

class TotalIncomeState extends Equatable {
  final States state;
  final String? errorMessage;
  final List<charts.Series<dynamic, int>>? seriesList;

  TotalIncomeState init() {
    return const TotalIncomeState();
  }

  TotalIncomeState clone() {
    return const TotalIncomeState();
  }

  TotalIncomeState loadedData({
    required States state,
    final List<charts.Series<dynamic, int>>? seriesList,
  }) {
    return TotalIncomeState(
      seriesList: seriesList ?? this.seriesList,
      state: state,
    );
  }

  TotalIncomeState error({required String errorMessage}) {
    return TotalIncomeState(
      state: States.error,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        state,
        errorMessage,
        seriesList,
      ];

  const TotalIncomeState({
    this.seriesList,
    this.state = States.initial,
    this.errorMessage,
  });
}
