part of 'entry_bloc.dart';

abstract class EntryEvent extends Equatable{
  const EntryEvent();
}

class EntryEventInitial extends EntryEvent {
  const EntryEventInitial();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

abstract class EntryVerificationEvent extends Equatable {
  const EntryVerificationEvent();
}

class EntryVerificationEventInitial extends EntryVerificationEvent {

  const EntryVerificationEventInitial();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class EntryVerificationEventSaveInformation extends EntryVerificationEvent {
  final Map<String, dynamic> entryVerificationData;
  const EntryVerificationEventSaveInformation(this.entryVerificationData);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}