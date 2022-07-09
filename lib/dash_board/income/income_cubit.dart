import 'package:bloc/bloc.dart';

import 'income_state.dart';

class IncomeCubit extends Cubit<IncomeState> {
  IncomeCubit() : super(IncomeState().init());
}
