import 'package:bloc/bloc.dart';

import 'section_drop_down_state.dart';

class SectionDropDownCubit extends Cubit<SectionDropDownState> {
  SectionDropDownCubit() : super(const SectionDropDownState().init());
}
