import 'package:bloc/bloc.dart';

class ProductNameEditable extends Cubit<bool> {
  ProductNameEditable() : super(false);

  void makeItEditable() => emit(true);
  void makeItUneditable() => emit(false);
}
