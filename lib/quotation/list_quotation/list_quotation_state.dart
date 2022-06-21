import 'package:equatable/equatable.dart';
import 'package:erp_fronted/quotation/models/quotation_model.dart';

enum States { initial, loading, loaded, error }

class ListQuotationState extends Equatable {
  final States state;
  final Quotations? quotations;
  final String? errorMessage;

  ListQuotationState init() {
    return const ListQuotationState();
  }

  ListQuotationState clone() {
    return const ListQuotationState();
  }

  ListQuotationState loadedInfo({
    required States state,
    Quotations? quotations,
  }) {
    return ListQuotationState(
      state: state,
      quotations: quotations ?? this.quotations,
    );
  }

  ListQuotationState error({String? errorMessage}) {
    return ListQuotationState(
      errorMessage: errorMessage ?? this.errorMessage,
      state: States.error,
    );
  }

  const ListQuotationState({
    this.state = States.initial,
    this.quotations,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        state,
        quotations,
        errorMessage,
      ];
}
