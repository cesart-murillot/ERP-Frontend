part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  const MainState();
}

class InitialState extends MainState {
  const InitialState();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class LoadingInfoState extends MainState {
  const LoadingInfoState();
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class LoadedInfoState extends MainState {
  final Modules modules;
  final Employee employee;
  const LoadedInfoState(this.modules, this.employee);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class ErrorLoadingInfoState extends MainState {
  const ErrorLoadingInfoState();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}