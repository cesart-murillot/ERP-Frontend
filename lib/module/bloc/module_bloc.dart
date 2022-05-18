/*
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:erp_fronted/module/models/module_model.dart';
import 'package:equatable/equatable.dart';
import '../../src/resources/repository.dart';

part 'module_event.dart';
part 'module_state.dart';

class ModuleBloc extends Bloc<ModuleEvent, ModuleState> {
*/
/*  final Repository repository;
  ModuleBloc({required this.repository}) : super(const ModuleState()){
    on<ModuleFetch>(_onModuleFetch);
  }

  Future<void> _onModuleFetch(ModuleFetch event, Emitter<ModuleState> emitter) async{
   try {
     if(state.status == ModuleStatus.initial) {
       Modules? models = await repository.fetchModuleList();
       return emitter(
         state.copyWith(status: ModuleStatus.success, models: models!)
       );
     }
   } catch (e) {
     emitter(state.copyWith(status: ModuleStatus.failure, models: null));
   }
  }*//*

  final Repository repository;

  ModuleBloc(this.repository) : super(const ModuleState()) {
    //on<ModuleFetch>(_initialEvent);
    on<ModuleFetch>(_initialEvent);
  }

  Future<void> _initialEvent(
      ModuleFetch event, Emitter<ModuleState> emit) async {
    try {
      if (state.status == ModuleStatus.initial) {
        final modules = await repository.fetchModuleList();
        return emit(state.copyWith(
          status: ModuleStatus.success,
          modules: modules,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: ModuleStatus.failure,
        modules: null,
      ));
    }
  }
}
*/
