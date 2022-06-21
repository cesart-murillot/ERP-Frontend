import 'package:equatable/equatable.dart';

abstract class ShowQuotationEvent extends Equatable {}

class InitEvent extends ShowQuotationEvent {
  final int quotationId;

  @override
  List<Object?> get props => [];

  InitEvent(this.quotationId);
}