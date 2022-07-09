import 'package:equatable/equatable.dart';

enum States { initial, loading, loaded, error }

class QuotationKeyState extends Equatable {
  final States state;
  final int? totalQuotations;
  final int? totalSales;
  final int? salesWithQuotations;
  final double? ratioQuotationsSales;
  final String? errorMessage;

  QuotationKeyState init() {
    return const QuotationKeyState();
  }

  QuotationKeyState clone() {
    return const QuotationKeyState();
  }

  QuotationKeyState error({required String errorMessage}) {
    return QuotationKeyState(
      state: States.error,
      errorMessage: errorMessage,
    );
  }

  QuotationKeyState loadedData({
    required States state,
    int? totalQuotations,
    int? totalSales,
    int? salesWithQuotations,
    double? ratioQuotationsSales,
  }) {
    return QuotationKeyState(
      state: state,
      totalQuotations: totalQuotations ?? this.totalQuotations,
      totalSales: totalSales ?? this.totalSales,
      salesWithQuotations: salesWithQuotations ?? this.salesWithQuotations,
      ratioQuotationsSales: ratioQuotationsSales ?? this.ratioQuotationsSales,
    );
  }

  @override
  List<Object?> get props => [
        state,
        totalQuotations,
        totalSales,
        salesWithQuotations,
        ratioQuotationsSales,
        errorMessage,
      ];

  const QuotationKeyState({
    this.state = States.initial,
    this.totalQuotations,
    this.totalSales,
    this.salesWithQuotations,
    this.ratioQuotationsSales,
    this.errorMessage,
  });
}
