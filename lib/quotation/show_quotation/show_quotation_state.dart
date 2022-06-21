import 'package:equatable/equatable.dart';
import 'package:erp_fronted/quotation/models/quotation_model.dart';

enum States { initial, loading, loaded, error }

class ShowQuotationState extends Equatable {
  final States state;
  final String? errorMessage;
  final Quotation? quotation;

  ShowQuotationState init() {
    return const ShowQuotationState();
  }

  ShowQuotationState clone() {
    return const ShowQuotationState();
  }

  ShowQuotationState loadingData({
    required States state,
    Quotation? quotation,
  }) {
    return ShowQuotationState(
      state: state,
      quotation: quotation ?? this.quotation,
    );
  }

  ShowQuotationState error({required String error}) {
    return ShowQuotationState(
      state: States.error,
      errorMessage: error,
    );
  }

  @override
  List<Object?> get props => [
        state,
        errorMessage,
        quotation,
  ];

  const ShowQuotationState({
    this.state = States.initial,
    this.errorMessage,
    this.quotation,
  });
}
