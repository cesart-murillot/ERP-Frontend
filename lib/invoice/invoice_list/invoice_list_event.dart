import 'package:equatable/equatable.dart';

abstract class InvoiceListEvent extends Equatable {}

class InitEvent extends InvoiceListEvent {
  @override
  List<Object?> get props => [];
}