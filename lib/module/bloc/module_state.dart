part of 'module_bloc.dart';

enum ModuleStatus { initial, success, failure }

/*
class ModuleState extends Equatable {
  const ModuleState({
    this.status = ModuleStatus.initial,
    this.models,
  });

  final ModuleStatus status;
  final Modules? models;

  ModuleState copyWith({
    ModuleStatus? status,
    Modules? models,
  }) {
    return ModuleState(
      status: status ?? this.status,
      models: models ?? this.models,
    );
  }

  @override
  String toString() {
    return '''ModulesState { status: $status, models: ${models?.models.length}''';
  }

  List<Object?> get props => [status, models];
}*/

class ModuleState extends Equatable {
  const ModuleState({this.status = ModuleStatus.initial, this.modules});

  final ModuleStatus status;
  final Modules? modules;

  ModuleState copyWith({
    ModuleStatus? status,
    Modules? modules,
  }) {
    return ModuleState(
      status: status ?? this.status,
      modules: modules ?? this.modules,
    );
  }

  @override
  List<Object?> get props => [status, modules];
}
