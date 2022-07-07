import 'package:equatable/equatable.dart';

enum States { initial, loading, loaded, error }

class TotalQuotationState extends Equatable {
  final States state;
  final String? errorMessage;
  final int numberOfQuotations;
  final String valueOfQuotations;

  TotalQuotationState init() {
    return const TotalQuotationState();
  }

  TotalQuotationState clone() {
    return const TotalQuotationState();
  }

  TotalQuotationState loadedData({
    required States state,
    int? numberOfQuotations,
    String? valueOfQuotations,
  }) {
    return TotalQuotationState(
      state: state,
      numberOfQuotations: numberOfQuotations ?? this.numberOfQuotations,
      valueOfQuotations: valueOfQuotations ?? this.valueOfQuotations,
    );
  }

  TotalQuotationState error({
    required String errorMessage,
  }) {
    return TotalQuotationState(
      state: States.error,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        state,
        numberOfQuotations,
        errorMessage,
      ];

  const TotalQuotationState({
    this.state = States.initial,
    this.errorMessage,
    this.numberOfQuotations = 0,
    this.valueOfQuotations = 'Not available data',
  });
}
