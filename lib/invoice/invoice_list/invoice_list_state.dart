import 'package:equatable/equatable.dart';
import 'package:erp_fronted/invoice/models/invoice_model.dart';

enum States { initial, loading, loaded, error }

class InvoiceListState extends Equatable {
  final States state;
  final String errorMessage;
  final Invoices? invoices;

  InvoiceListState init() {
    return const InvoiceListState();
  }

  InvoiceListState clone({
    required States state,
    Invoices? invoices,
  }) {
    return InvoiceListState(
      state: state,
      invoices: invoices ?? this.invoices,
    );
  }

  InvoiceListState error({required String errorMessage}) {
    return InvoiceListState(
      state: States.error,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        state,
        errorMessage,
        invoices,
      ];

  const InvoiceListState({
    this.state = States.initial,
    this.errorMessage = '',
    this.invoices,
  });
}
