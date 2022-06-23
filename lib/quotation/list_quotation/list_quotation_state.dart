import 'package:equatable/equatable.dart';
import 'package:erp_fronted/quotation/models/quotation_model.dart';
import 'package:flutter/material.dart';

enum States { initial, loading, loaded, error }

class ListQuotationState extends Equatable {
  final States state;
  final Quotations? quotations;
  final String? errorMessage;
  final List<DataColumn>? dataColumn;
  final List<DataRow>? dataRow;

  ListQuotationState init() {
    return const ListQuotationState();
  }

  ListQuotationState clone() {
    return const ListQuotationState();
  }

  ListQuotationState loadedInfo({
    required States state,
    Quotations? quotations,
    final List<DataColumn>? dataColumn,
    final List<DataRow>? dataRow,
  }) {
    return ListQuotationState(
      state: state,
      quotations: quotations ?? this.quotations,
      dataColumn: dataColumn ?? this.dataColumn,
      dataRow: dataRow ?? this.dataRow,
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
    this.dataColumn,
    this.dataRow,
  });

  @override
  List<Object?> get props => [
        state,
        quotations,
        errorMessage,
        dataColumn,
        dataRow,
      ];
}
