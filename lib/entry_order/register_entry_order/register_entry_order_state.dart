import 'package:equatable/equatable.dart';

abstract class RegisterEntryOrderState extends Equatable {
  const RegisterEntryOrderState();
}

class InitState extends RegisterEntryOrderState {
  @override
  List<Object?> get props => [];

  const InitState();
}
