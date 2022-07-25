import 'package:equatable/equatable.dart';
import 'package:erp_fronted/branch/models/section_model.dart';

enum States { initial, loading, loaded, error }

class SectionSearchState extends Equatable {
  final States state;
  final String errorMessage;
  final Sections? sections;

  SectionSearchState init() {
    return const SectionSearchState();
  }

  SectionSearchState clone({required States state, Sections? sections}) {
    return SectionSearchState(
      sections: sections ?? this.sections,
      state: state,
    );
  }

  @override
  List<Object?> get props => [
        state,
        errorMessage,
        sections,
      ];

  const SectionSearchState({
    this.state = States.initial,
    this.errorMessage = '',
    this.sections,
  });
}
