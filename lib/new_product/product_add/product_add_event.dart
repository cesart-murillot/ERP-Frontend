import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

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

class UploadImageEvent extends ProductAddEvent {
  final XFile image;

  @override
  List<Object?> get props => [image];

  const UploadImageEvent(this.image);
}

class StoreModelEvent extends ProductAddEvent {
  final String model;

  @override
  List<Object?> get props => [model];

  const StoreModelEvent(this.model);
}

class StoreFormatEvent extends ProductAddEvent {
  final String format;

  @override
  List<Object?> get props => [format];

  const StoreFormatEvent(this.format);
}

class SaveDataEvent extends ProductAddEvent {
  @override
  List<Object?> get props => [];

  const SaveDataEvent();
}