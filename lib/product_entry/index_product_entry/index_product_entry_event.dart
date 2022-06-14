import 'package:equatable/equatable.dart';

abstract class IndexProductEntryEvent extends Equatable {
  const IndexProductEntryEvent();
}

class InitEvent extends IndexProductEntryEvent {
  @override
  List<Object?> get props => [];
}

class ReloadEvent extends IndexProductEntryEvent {
  const ReloadEvent();

  @override
  List<Object> get props => [];
}