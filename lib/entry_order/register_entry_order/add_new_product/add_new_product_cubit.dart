import 'package:bloc/bloc.dart';

class AddNewProductCubit extends Cubit<int> {
  AddNewProductCubit() : super(0);

  void addInputField() => emit(state + 1);
  void removeInputField() {
    if (state - 1 > 0) {
       return emit(state - 1);
    }
    emit(0);
  }
}
