import 'package:equatable/equatable.dart';

abstract class DashBoardEvent extends Equatable {}

class InitEvent extends DashBoardEvent {
  @override
  List<Object?> get props => [];
}
