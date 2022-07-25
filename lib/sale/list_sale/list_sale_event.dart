import 'package:equatable/equatable.dart';

abstract class ListSaleEvent extends Equatable {
  const ListSaleEvent();
}

class InitEvent extends ListSaleEvent {
  @override
  List<Object?> get props => [];

  const InitEvent();
}

class ReloadListSalePageEvent extends ListSaleEvent {
  @override
  List<Object?> get props => [];

  const ReloadListSalePageEvent();
}