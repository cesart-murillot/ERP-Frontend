import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'menu_inventory_event.dart';
import 'menu_inventory_state.dart';

class MenuInventoryBloc extends Bloc<MenuInventoryEvent, MenuInventoryState> {
  MenuInventoryBloc() : super(const MenuInventoryState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<MenuInventoryState> emit) async {
    emit(state.clone());
    final prefs = await SharedPreferences.getInstance();
    final int? roleId = prefs.getInt('roleId');

    if (roleId != null) {
      emit(state.clone(roleId: roleId));
    }
  }
}
