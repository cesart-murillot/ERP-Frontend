import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:erp_fronted/quotation/models/quotation_model.dart';
import 'package:erp_fronted/src/resources/get_object.dart';
import 'package:flutter/material.dart';

import 'list_quotation_event.dart';
import 'list_quotation_state.dart';

class ListQuotationBloc extends Bloc<ListQuotationEvent, ListQuotationState> {
  ListQuotationBloc() : super(const ListQuotationState().init()) {
    on<InitEvent>(_init);
    on<ReloadEvent>(_reload);
  }

  void _init(InitEvent event, Emitter<ListQuotationState> emit) async {
    emit(state.loadedInfo(state: States.loading));

    final url = preDefinedUri('/api/quotations/');
    try {
      final Quotations quotations = await getObject(url, Quotations.serializer);

      final List<DataColumn> dataColumn = [];
      dataColumn.add(const DataColumn(label: Text('Fecha')));
      dataColumn.add(const DataColumn(label: Text('Cliente')));
      dataColumn.add(const DataColumn(label: Text('Monto')));

      emit(state.loadedInfo(
        state: States.loaded,
        quotations: quotations,
      ));
    } catch (e) {
      emit(state.error(errorMessage: e.toString()));
    }
  }

  FutureOr<void> _reload(ReloadEvent event, Emitter<ListQuotationState> emit) {
    add(InitEvent());
  }
}
