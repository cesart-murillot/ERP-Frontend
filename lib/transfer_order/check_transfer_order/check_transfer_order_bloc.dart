import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:erp_fronted/src/resources/get_object.dart';
import 'package:erp_fronted/src/resources/post_object.dart';
import 'package:erp_fronted/transfer_order/models/transfer_order_model.dart';
import 'package:flutter/material.dart';

import 'check_transfer_order_event.dart';
import 'check_transfer_order_state.dart';

class CheckTransferOrderBloc
    extends Bloc<CheckTransferOrderEvent, CheckTransferOrderState> {
  CheckTransferOrderBloc() : super(const CheckTransferOrderState().init()) {
    on<InitEvent>(_init);
    on<MarkAsSentEvent>(_markAsSent);
    on<MarkAsReceivedEvent>(_markAsReceived);
    on<HideDialogEvent>(_hideDialogEvent);
    on<ShowSentDialogEvent>(_showSentDialog);
    on<ShowReceivedDialogEvent>(_showReceivedDialog);
  }

  void _init(InitEvent event, Emitter<CheckTransferOrderState> emit) async {
    emit(const CheckTransferOrderState().loadingData(state: States.loading));
    final url = preDefinedUri('/api/transfer_orders/${event.transferOrderId}');
    try {
      final TransferOrder transferOrder = await getObject(url, TransferOrder.serializer);
      emit(const CheckTransferOrderState()
          .loadingData(state: States.loaded, transferOrder: transferOrder));
    } catch (e) {
      emit(const CheckTransferOrderState().error(e.toString()));
    }
  }

  Future<FutureOr<void>> _markAsSent(MarkAsSentEvent event, Emitter<CheckTransferOrderState> emit) async {

    //emit(const CheckTransferOrderState().hideDialog());
    final url = preDefinedUri('/api/transfer_orders/register_transfer/${state.transferOrder?.id}');
    try {
      final String response = await postDataToApi(url, '');
      add(InitEvent(state.transferOrder!.id));
      print(response);
    } catch (e) {
      add(const HideDialogEvent());
      print(e);
    }
  }

  Future<FutureOr<void>> _markAsReceived(MarkAsReceivedEvent event, Emitter<CheckTransferOrderState> emit) async {
    final url = preDefinedUri('api/transfer_orders/register_reception/${state.transferOrder?.id}');
    try {
      final String response = await postDataToApi(url, '');
      add(InitEvent(state.transferOrder!.id));
      print(response);
    } catch (e) {
      add(const HideDialogEvent());
      print(e);
    }
  }

  FutureOr<void> _hideDialogEvent(HideDialogEvent event, Emitter<CheckTransferOrderState> emit) {
    emit(const CheckTransferOrderState().loadingData(state: States.loaded, transferOrder: state.transferOrder, dialog: Dialogs.none));
  }

  FutureOr<void> _showSentDialog(ShowSentDialogEvent event, Emitter<CheckTransferOrderState> emit) {
    emit(const CheckTransferOrderState().loadingData(state: States.loaded, transferOrder: state.transferOrder, dialog: Dialogs.sent));
  }

  FutureOr<void> _showReceivedDialog(ShowReceivedDialogEvent event, Emitter<CheckTransferOrderState> emit) {
    emit(const CheckTransferOrderState().loadingData(state: States.loaded, transferOrder: state.transferOrder, dialog: Dialogs.received));
  }
}
