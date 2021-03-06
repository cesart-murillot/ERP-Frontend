import 'package:equatable/equatable.dart';
import 'package:erp_fronted/src/resources/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/module_model.dart';

part 'module_state.dart';

class ModuleCubit extends Cubit<ModuleState> {

  final Repository _moduleRepository;
  ModuleCubit(this._moduleRepository) : super(const ModuleInitial());

  Future<void> getModules() async {
    emit(const ModuleLoading());
    try {
      final modules = await _moduleRepository.fetchModuleList();
      emit(ModuleLoaded(modules));
    } catch(e){
      emit(const ModuleError("Failed"));
    }
  }
}