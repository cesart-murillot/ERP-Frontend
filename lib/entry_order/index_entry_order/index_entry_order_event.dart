import 'package:equatable/equatable.dart';

abstract class IndexEntryOrderEvent extends Equatable {
  const IndexEntryOrderEvent();
}

class InitEvent extends IndexEntryOrderEvent {
  @override
  List<Object?> get props => [];
}

class ReloadEvent extends IndexEntryOrderEvent {
  const ReloadEvent();

  @override
  List<Object> get props => [];
}