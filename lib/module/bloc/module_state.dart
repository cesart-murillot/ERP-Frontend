part of 'module_bloc.dart';

enum ModuleStatus { initial, success, failure }

/*
class ModuleState extends Equatable {
  const ModuleState({
    this.status = ModuleStatus.initial,
    this.modules,
  });

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
  String toString() {
    return '''ModulesState { status: $status, modules: ${modules?.modules.length}''';
  }

  List<Object?> get props => [status, modules];
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
