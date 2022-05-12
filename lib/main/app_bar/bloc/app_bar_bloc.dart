

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'app_bar_event.dart';
part 'app_bar_state.dart';

class AppBarBloc extends Bloc<AppBarEvent, AppBarState> {
  AppBarBloc() : super(const AppBarStateInitial()) {
    on<AppBarEventMain>((event, emit) => emit(const AppBarStateInitial()));
    on<AppBarEventProduct>((event, emit) => emit(const AppBarStateProduct()));
    on<AppBarEventGeneric>(_genericEvent);
  }
  void _genericEvent(AppBarEventGeneric event, Emitter<AppBarState> emitter){
    switch (event.page) {
      case 'product':
        emitter(const AppBarStateProduct());
        break;
      case 'inventory':
        emitter(const AppBarStateInventory());
        break;
      case 'employee':
        emitter(const AppBarStateEmployee());
        break;
      case 'branch':
        emitter(const AppBarStateBranch());
        break;
      case 'billing':
        emitter(const AppBarStateBilling());
        break;
      default:
        emitter(const AppBarStateInitial());
        break;
    }
  }
}
