import 'package:bloc/bloc.dart';

import 'form_generator_state.dart';

class FormGeneratorCubit extends Cubit<FormGeneratorState> {
  FormGeneratorCubit() : super(const FormGeneratorState().init());

  void addElement() {
    final int elements = state.elements + 1;
    return emit(const FormGeneratorState().numberOfElements(elements));
  }

  void removeElement() {
    final int elements = state.elements - 1;
    if (elements < 1) {
      return emit(const FormGeneratorState().numberOfElements(1));
    }
    return emit(const FormGeneratorState().numberOfElements(elements));
  }
}
