import 'dart:async';

import 'package:bloc/bloc.dart';

import 'product_add_event.dart';
import 'product_add_state.dart';

class ProductAddBloc extends Bloc<ProductAddEvent, ProductAddState> {
  ProductAddBloc() : super(const ProductAddState().init()) {
    on<InitEvent>(_init);
    on<ShowAddInfoEvent>(_showAddInfo);
  }

  void _init(InitEvent event, Emitter<ProductAddState> emit) async {
    emit(state.clone());
  }

  FutureOr<void> _showAddInfo(ShowAddInfoEvent event, Emitter<ProductAddState> emit) {
    emit(state.addAddInfo(addInfo: event.showAddInfo, techInfo: event.showTechInfo));
  }

}
