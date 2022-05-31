import 'package:equatable/equatable.dart';

class FormGeneratorState extends Equatable {
  final int elements;
  FormGeneratorState init() {
    return const FormGeneratorState();
  }

  FormGeneratorState clone() {
    return const FormGeneratorState();
  }

  FormGeneratorState numberOfElements(int elements) {
    return FormGeneratorState(elements: elements);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [elements];

  const FormGeneratorState({this.elements = 1});
}
