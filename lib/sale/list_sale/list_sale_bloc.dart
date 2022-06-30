import 'package:bloc/bloc.dart';
import 'package:erp_fronted/sale/models/sale_model.dart';
import 'package:erp_fronted/src/resources/get_object.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'list_sale_event.dart';
import 'list_sale_state.dart';

class ListSaleBloc extends Bloc<ListSaleEvent, ListSaleState> {
  ListSaleBloc() : super(const ListSaleState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<ListSaleState> emit) async {
    emit(state.loadData(state: States.loading));

    final prefs = await SharedPreferences.getInstance();
    final branchId = prefs.getInt('branchId');

    final url = preDefinedUri('/api/sales/', {'branch': branchId.toString()});
    print(url);
    final sales = await getObject(url, Sales.serializer);

    emit(state.loadData(state: States.loaded, sales: sales));
  }
}
