import 'package:equatable/equatable.dart';

abstract class VerifyEntryOrderEvent extends Equatable {
  const VerifyEntryOrderEvent();
}

class InitEvent extends VerifyEntryOrderEvent {
  const InitEvent();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class GetEntryOrderEvent extends VerifyEntryOrderEvent {
  final int id;

  const GetEntryOrderEvent(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}