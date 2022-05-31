import 'package:equatable/equatable.dart';

abstract class ProductAddEvent extends Equatable {
  const ProductAddEvent();
}

class InitEvent extends ProductAddEvent {
  @override
  List<Object?> get props => [];

  const InitEvent();
}

class ShowAddInfoEvent extends ProductAddEvent {
  final bool showAddInfo;
  final bool showTechInfo;
  const ShowAddInfoEvent(this.showAddInfo, this.showTechInfo);

  @override
  List<Object> get props => [showAddInfo];
}

class ShowTechInfoEvent extends ProductAddEvent {
  final bool showTechInfo;
  const ShowTechInfoEvent(this.showTechInfo);
  @override
  List<Object> get props => [showTechInfo];
}