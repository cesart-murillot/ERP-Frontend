import 'package:bloc/bloc.dart';

import 'custom_form_field_state.dart';

class CustomFormFieldCubit extends Cubit<CustomFormFieldState> {
  CustomFormFieldCubit() : super(CustomFormFieldState().init());
}
