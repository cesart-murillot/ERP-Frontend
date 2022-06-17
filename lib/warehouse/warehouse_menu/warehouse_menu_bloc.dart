import 'package:bloc/bloc.dart';

import 'warehouse_menu_event.dart';
import 'warehouse_menu_state.dart';

class WarehouseMenuBloc extends Bloc<WarehouseMenuEvent, WarehouseMenuState> {
  WarehouseMenuBloc() : super(WarehouseMenuState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<WarehouseMenuState> emit) async {
    emit(state.clone());
  }
}
