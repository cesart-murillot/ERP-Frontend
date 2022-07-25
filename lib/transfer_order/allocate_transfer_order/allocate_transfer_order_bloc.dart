import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:erp_fronted/branch/models/section_model.dart';
import 'package:erp_fronted/branch/models/warehouse_model.dart';
import 'package:erp_fronted/product_request/models/product_transfer_model.dart';
import 'package:erp_fronted/src/resources/generic_serializer.dart';
import 'package:erp_fronted/src/resources/get_object.dart';
import 'package:erp_fronted/src/resources/post_object.dart';
import 'package:erp_fronted/transfer_order/models/b_inventory_model.dart';
import 'package:flutter/cupertino.dart';

import 'allocate_transfer_order_event.dart';
import 'allocate_transfer_order_state.dart';

class AllocateTransferOrderBloc
    extends Bloc<AllocateTransferOrderEvent, AllocateTransferOrderState> {
  AllocateTransferOrderBloc()
      : super(const AllocateTransferOrderState().init()) {
    on<InitEvent>(_init);
    on<AddWarehouseEvent>(_addWarehouse);
    on<AddSectionEvent>(_addSection);
    on<AllocateProductEvent>(_allocateProduct);
  }

  void _init(InitEvent event, Emitter<AllocateTransferOrderState> emit) async {
    emit(state.clone(state: States.loading));

    final url =
        preDefinedUri('/api/productTransfer/${event.transferProductId}');

    try {
      final productTransfer = await getObject(url, ProductTransfer.serializer);
      emit(state.clone(state: States.loaded, productTransfer: productTransfer));
    } catch (e) {
      print(e);
    }
  }

  FutureOr<void> _addWarehouse(
      AddWarehouseEvent event, Emitter<AllocateTransferOrderState> emit) async {
    emit(state.clone(state: States.loading));
    final url =
        preDefinedUri('/api/warehouses/${event.warehouseId}', {'only': 'name'});

    try {
      final Warehouse warehouse = await getObject(url, Warehouse.serializer);
      final List<Warehouse> newWarehouses = [];
      final List<Section?> newSections = [];
      final List<TextEditingController> newQuantities = [];

      final warehousesState = state.warehouses;
      final sectionsState = state.sections;
      final quantities = state.quantities;

      newWarehouses.addAll(warehousesState);
      newWarehouses.add(warehouse);

      newSections.addAll(sectionsState);
      newSections.add(null);

      newQuantities.addAll(quantities);
      newQuantities.add(TextEditingController());

      emit(state.clone(
        state: States.loaded,
        warehouses: newWarehouses,
        sections: newSections,
        quantities: newQuantities,
      ));
    } catch (e) {
      print(e);
    }
  }

  FutureOr<void> _addSection(AddSectionEvent event, Emitter<AllocateTransferOrderState> emit) async {
    emit(state.clone(state: States.loading));

    final url = preDefinedUri('/api/sections/${event.sectionId}');

    try {
      final Section section = await getObject(url, Section.serializer);

      final List<Section?> newSections = [];
      final sectionsState = state.sections;

      newSections.addAll(sectionsState);
      newSections[event.index] = section;

      emit(state.clone(state: States.loaded, sections: newSections));
    } catch (e) {
      print(e);
    }
  }

  FutureOr<void> _allocateProduct(AllocateProductEvent event, Emitter<AllocateTransferOrderState> emit) async {
    var bInventories = BInventories(
        (bI) {
          for (int i = 0; i < state.warehouses.length; i++) {
            final int quantity = int.parse(state.quantities[i].value.text);
            var bInventory = BInventory(
                (b0) {
                  b0.quantity = quantity;
                  b0.productId = state.productTransfer?.productId;
                  b0.sectionId = state.sections[i]?.id;
                  b0.productTransferId = state.productTransfer?.id;
                }
            );
            bI.bInventories.add(bInventory);
          }
        }
    );
    final url = preDefinedUri('/api/bInventory/');
    final bInventoriesString = objectToString(bInventories, BInventories.serializer);
    if (bInventoriesString != null) {
      try {
        final response = await postDataToApi(url, bInventoriesString);
        print(response);
      } catch (e) {
        print(e);
      }
    }
  }
}
