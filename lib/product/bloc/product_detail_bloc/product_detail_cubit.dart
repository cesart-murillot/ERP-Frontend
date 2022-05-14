import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class FieldEditableCubit extends Cubit<bool> {
  FieldEditableCubit() : super(false);

  void makeItEditable() => emit(true);
  void makeItUneditable() => emit(false);
}

class GetFieldInfoToUpdateCubit extends Bloc<ProductDetailEvent, ProductDetailState> {
  GetFieldInfoToUpdateCubit() : super(const ProductDetailStateInitial()){
    on<ProductDetailEventPostProductChanges>(_getProductChanges);
  }


  FutureOr<void> _getProductChanges(ProductDetailEventPostProductChanges event, Emitter<ProductDetailState> emit) {
    print(event.changes);
  }
}
