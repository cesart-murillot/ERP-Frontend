import 'package:equatable/equatable.dart';

abstract class RegisterEntryOrderEvent extends Equatable {

  const RegisterEntryOrderEvent();
}

class InitEvent extends RegisterEntryOrderEvent {
  @override
  List<Object?> get props => [];

  const InitEvent();
}