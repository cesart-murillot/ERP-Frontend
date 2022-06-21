import 'package:equatable/equatable.dart';

abstract class ListQuotationEvent extends Equatable {
  const ListQuotationEvent();
}

class InitEvent extends ListQuotationEvent {
  @override
  List<Object?> get props => [];
}