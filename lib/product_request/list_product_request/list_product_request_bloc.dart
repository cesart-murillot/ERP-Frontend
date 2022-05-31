import 'package:bloc/bloc.dart';
import 'package:erp_fronted/branch/models/branch_model.dart';
import 'package:erp_fronted/product_request/models/transfer_model.dart';
import 'package:erp_fronted/src/resources/get_object.dart';

import 'list_product_request_event.dart';
import 'list_product_request_state.dart';

class ListProductRequestBloc extends Bloc<ListProductRequestEvent, ListProductRequestState> {
  ListProductRequestBloc() : super(const ListProductRequestState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<ListProductRequestState> emit) async {
    emit(const ListProductRequestState().loadingInfo(state: States.loading));
    final transferUrl = preDefinedUri('api/transfers/');
    final Transfers transfers = await getObject(transferUrl, Transfers.serializer);
    emit(const ListProductRequestState().loadingInfo(state: States.loaded, transfers: transfers));
  }
}
