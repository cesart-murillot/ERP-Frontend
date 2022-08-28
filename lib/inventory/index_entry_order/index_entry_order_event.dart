import 'package:equatable/equatable.dart';
import 'package:erp_fronted/entry_order/index_entry_order/index_entry_order_event.dart';

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

class VerifiedSelectedEvent extends IndexEntryOrderEvent {
  @override
  List<Object?> get props => [];

  const VerifiedSelectedEvent();
}

class AllSelectedEvent extends IndexEntryOrderEvent {
  @override
  List<Object?> get props => [];

  const AllSelectedEvent();
}

class PendentSelectedEvent extends IndexEntryOrderEvent {
  @override
  List<Object?> get props => [];

  const PendentSelectedEvent();
}

class ErrorSelectedEvent extends IndexEntryOrderEvent {
  @override
  List<Object?> get props => [];

  const ErrorSelectedEvent();
}