import 'package:equatable/equatable.dart';

enum States { initial, loading, loaded, error }

class CreateQuotationState extends Equatable {
  final States state;
  final List<Map<String, dynamic>> quotationData;
  final String errorMessage;

  CreateQuotationState init() {
    return const CreateQuotationState();
  }

  CreateQuotationState clone({
    required States state,
    List<Map<String, dynamic>>? quotationData,
  }) {
    return CreateQuotationState(
      state: state,
      quotationData: quotationData ?? this.quotationData,
    );
  }

  @override
  List<Object?> get props => [
        state,
        quotationData,
        errorMessage,
      ];

  const CreateQuotationState({
    this.errorMessage = '',
    this.state = States.initial,
    this.quotationData = const [],
  });
}
