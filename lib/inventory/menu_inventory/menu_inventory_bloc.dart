import 'package:bloc/bloc.dart';

import 'menu_inventory_event.dart';
import 'menu_inventory_state.dart';

class MenuInventoryBloc extends Bloc<MenuInventoryEvent, MenuInventoryState> {
  MenuInventoryBloc() : super(MenuInventoryState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<MenuInventoryState> emit) async {
    emit(state.clone());
  }
}
