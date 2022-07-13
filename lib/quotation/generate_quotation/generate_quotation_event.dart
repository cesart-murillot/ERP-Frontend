import 'package:equatable/equatable.dart';

abstract class GenerateQuotationEvent extends Equatable {}

class InitEvent extends GenerateQuotationEvent {
  @override
  List<Object?> get props => [];
}

class AddProductQuotationEvent extends GenerateQuotationEvent {
  @override
  List<Object?> get props => [];
}

