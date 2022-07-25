import 'package:equatable/equatable.dart';
import 'package:erp_fronted/branch/models/section_model.dart';
import 'package:erp_fronted/branch/models/warehouse_model.dart';
import 'package:erp_fronted/product_request/models/product_transfer_model.dart';
import 'package:flutter/material.dart';

enum States { initial, loading, loaded, error }

class AllocateTransferOrderState extends Equatable {
  final States state;
  final String errorMessage;
  final ProductTransfer? productTransfer;
  final List<TextEditingController> quantities;
  final List<Warehouse> warehouses;
  final List<Section?> sections;

  AllocateTransferOrderState init() {
    return const AllocateTransferOrderState();
  }

  AllocateTransferOrderState clone({
    required States state,
    ProductTransfer? productTransfer,
    List<Warehouse>? warehouses,
    List<TextEditingController>? quantities,
    List<Section?>? sections,
  }) {
    return AllocateTransferOrderState(
      state: state,
      productTransfer: productTransfer ?? this.productTransfer,
      warehouses: warehouses ?? this.warehouses,
      quantities: quantities ?? this.quantities,
      sections: sections ?? this.sections,
    );
  }

  @override
  List<Object?> get props => [
        state,
        errorMessage,
        productTransfer,
        quantities,
        warehouses,
        sections,
      ];

  const AllocateTransferOrderState({
    this.sections = const [],
    this.warehouses = const [],
    this.quantities = const [],
    this.state = States.initial,
    this.errorMessage = '',
    this.productTransfer,
  });
}
