import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum States { loading, loaded, initial}

class SectionDropDownState extends Equatable {
  final List<DropdownMenuItem<int>>? sectionList;
  final States state;

  SectionDropDownState init() {
    return const SectionDropDownState();
  }

  SectionDropDownState clone() {
    return const SectionDropDownState();
  }

  @override
  List<Object?> get props => [];

  const SectionDropDownState({this.sectionList, this.state = States.initial});
}
