import 'package:bloc/bloc.dart';

import 'register_entry_state.dart';

class RegisterEntryCubit extends Cubit<RegisterEntryState> {
  RegisterEntryCubit() : super(RegisterEntryState().init());
  void printFromCubit(String value) {
    print(value);
  }
}
