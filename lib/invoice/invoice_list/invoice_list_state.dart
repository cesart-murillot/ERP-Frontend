import 'package:equatable/equatable.dart';

enum States { initial, loading, loaded, error }

class InvoiceListState extends Equatable {
  final States state;
  final String errorMessage;

  InvoiceListState init() {
    return const InvoiceListState();
  }

  InvoiceListState clone() {
    return const InvoiceListState();
  }

  @override
  List<Object?> get props => [
        state,
        errorMessage,
      ];

  const InvoiceListState({
    this.state = States.initial,
    this.errorMessage = '',
  });
}
