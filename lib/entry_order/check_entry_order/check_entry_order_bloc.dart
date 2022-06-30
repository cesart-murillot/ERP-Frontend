import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:erp_fronted/entry_order/models/entry_order_model.dart';
import 'package:erp_fronted/src/resources/get_object.dart';
import 'package:erp_fronted/src/resources/post_object.dart';

import 'check_entry_order_event.dart';
import 'check_entry_order_state.dart';

class CheckEntryOrderBloc
    extends Bloc<CheckEntryOrderEvent, CheckEntryOrderState> {
  CheckEntryOrderBloc() : super(const CheckEntryOrderState().init()) {
    on<InitEvent>(_init);
    on<MarkAsCheckedEvent>(_markAsChecked);
    on<VerifyEvent>(_verify);
    on<ReloadEvent>(_reload);
  }

  void _init(InitEvent event, Emitter<CheckEntryOrderState> emit) async {
    emit(state.loadedData(state: States.loading));

    final url = preDefinedUri('/api/entryorders/${event.entryOrderId}');
    try {
      final EntryOrder entryOrder = await getObject(url, EntryOrder.serializer);

      if (entryOrder.verifiedEntryOrder == true) {
        return emit(state.loadedData(
          state: States.checked,
          entryOrder: entryOrder,
        ));
      } else {
        final List<bool> verified =
            List.filled(entryOrder.entryOrderProduct!.length, false);
        return emit(state.loadedData(
            state: States.unchecked,
            entryOrder: entryOrder,
            verified: verified));
      }
    } catch (e) {
      print(e);
    }
  }

  void _markAsChecked(
      MarkAsCheckedEvent event, Emitter<CheckEntryOrderState> emit) {
    emit(state.loadedData(
        state: States.loading,
        entryOrder: state.entryOrder,
        verified: state.verified));

    state.verified![event.index] = event.value;

    if (state.verified!.every((element) => element == true)) {
      print('all checked');
      return emit(
        state.loadedData(
          state: States.unchecked,
          entryOrder: state.entryOrder,
          verified: state.verified,
          showVerifyButton: true,
        ),
      );
    }

    emit(state.loadedData(
        state: States.unchecked,
        entryOrder: state.entryOrder,
        verified: state.verified));
  }

  FutureOr<void> _verify(
      VerifyEvent event, Emitter<CheckEntryOrderState> emit) {
    final url =
        preDefinedUri('/api/entryorders/verify/${state.entryOrder!.id}');
    try {
      final response = postDataToApi(url, '');
      add(InitEvent(state.entryOrder!.id!));
    } catch (e) {
      print(e);
    }
  }

  FutureOr<void> _reload(ReloadEvent event, Emitter<CheckEntryOrderState> emit) {
    add(InitEvent(state.entryOrder!.id!));
  }
}
