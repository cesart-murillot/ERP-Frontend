import 'package:bloc/bloc.dart';
import 'package:erp_fronted/product_request/models/transfer_model.dart';
import 'package:erp_fronted/src/resources/get_object.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'list_product_request_event.dart';
import 'list_product_request_state.dart';

class ListProductRequestBloc extends Bloc<ListProductRequestEvent, ListProductRequestState> {
  ListProductRequestBloc() : super(const ListProductRequestState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<ListProductRequestState> emit) async {
    emit(const ListProductRequestState().loadingInfo(state: States.loading));

    final prefs = await SharedPreferences.getInstance();
    final roleId = prefs.getInt('roleId');
    final branchId = prefs.getInt('branchId');
    if (roleId == null || branchId == null) {
      return emit(state.error(errorMessage: 'No roleId'));
    }

    if (roleId == 1 || roleId == 2) {
      final transferUrl = preDefinedUri('/api/transfers/');
      try {
        final Transfers transfers = await getObject(transferUrl, Transfers.serializer);
        return emit(const ListProductRequestState().loadingInfo(state: States.loaded, transfers: transfers));
      } catch (e) {
        return emit(state.error(errorMessage: e.toString()));
      }
    }

    final transferUrl = preDefinedUri('/api/transfers/', {'branch': branchId.toString()});

    try {
      final Transfers transfers = await getObject(transferUrl, Transfers.serializer);
      return emit(const ListProductRequestState().loadingInfo(state: States.loaded, transfers: transfers));
    } catch (e) {
      return emit(state.error(errorMessage: e.toString()));
    }
  }
}
