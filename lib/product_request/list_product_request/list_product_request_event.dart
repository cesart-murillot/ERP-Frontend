import 'package:equatable/equatable.dart';

abstract class ListProductRequestEvent extends Equatable {
  const ListProductRequestEvent();
}

class InitEvent extends ListProductRequestEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}