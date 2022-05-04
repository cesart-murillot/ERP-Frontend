part of 'module_cubit.dart';

abstract class ModuleState extends Equatable {
  const ModuleState();

  @override
  List<Object?> get props => [];
}

class ModuleInitial extends ModuleState {
  const ModuleInitial();
}

class ModuleLoading extends ModuleState {
  const ModuleLoading();
}

class ModuleLoaded extends ModuleState {
  final Modules? modules;
  const ModuleLoaded(this.modules);
}

class ModuleError extends ModuleState {
  final String message;
  const ModuleError(this.message);
}