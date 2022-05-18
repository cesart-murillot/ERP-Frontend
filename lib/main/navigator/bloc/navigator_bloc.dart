import 'package:equatable/equatable.dart';
import 'package:erp_fronted/inventory/models/entry_model.dart';
import 'package:erp_fronted/product/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigator_event.dart';

part 'navigator_state.dart';

class NavigatorBloc extends Bloc<NavigatorEvent, NavigatorState> {
  NavigatorBloc() : super(const NavigatorStateInitial()) {
    on<NavigatorEventInitial>(
      (event, emit) => emit(
        const NavigatorStateInitial(),
      ),
    );

    on<NavigatorEventProductDetail>(
      (event, emit) => emit(
        NavigatorStateProductDetail(
          event.product,
        ),
      ),
    );

    on<NavigatorEventProductCreate>(
      (event, emit) => emit(
        const NavigatorStateProductCreate(),
      ),
    );

    on<NavigatorEventEntryVerification>(
      (event, emit) => emit(
        NavigatorStateEntryVerification(
          event.entry,
        ),
      ),
    );

/*    on<NavigatorEventProductCreate>((event, emit) {
      emit(NavigatorStateProductCreate());
      print('emitted');
    },);*/
  }
}
