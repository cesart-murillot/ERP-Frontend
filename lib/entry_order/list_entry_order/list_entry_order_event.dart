import 'package:equatable/equatable.dart';

abstract class ListEntryOrderEvent extends Equatable {
  const ListEntryOrderEvent();
}

class InitEvent extends ListEntryOrderEvent {

  @override
  List<Object?> get props => [];

  const InitEvent();
}

class FetchList extends ListEntryOrderEvent {

  const FetchList();

  @override
  List<Object?> get props => [];
}