import 'package:equatable/equatable.dart';
import 'package:erp_fronted/employee/models/user_model.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
}

class InitEvent extends MainEvent {
  @override
  List<Object?> get props => [];

  const InitEvent();
}

class ShowPageEvent extends MainEvent {
  final String routePage;
  final User user;
  const ShowPageEvent(this.routePage, this.user);

  @override
  List<Object> get props => [routePage];
}

class TryEvent extends MainEvent {
  const TryEvent();

  @override
  List<Object> get props => [];
}