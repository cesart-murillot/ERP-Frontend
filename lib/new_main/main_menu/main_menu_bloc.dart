import 'package:bloc/bloc.dart';
import 'package:erp_fronted/employee/models/user_model.dart';
import 'package:erp_fronted/src/resources/get_object.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main_menu_event.dart';
import 'main_menu_state.dart';

class MainMenuBloc extends Bloc<MainMenuEvent, MainMenuState> {
  MainMenuBloc() : super(const MainMenuState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<MainMenuState> emit) async {
    emit(state.clone(state: States.loading));

    try {
      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getInt('userId');

      final url = preDefinedUri('/api/users/'+ userId.toString(), {'with': 'all'});
      final User user = await getObject(url, User.serializer);

      await prefs.setInt('branchId', user.employee!.branchID!);
      await prefs.setInt('roleId', user.roleId!);

      emit(state.clone(state: States.loaded, user: user));
    } catch (e) {
      emit(state.error(errorMessage: e.toString()));
    }
  }
}
