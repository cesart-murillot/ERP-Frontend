part of 'entry_bloc.dart';

abstract class EntryState {
  const EntryState();
}

class EntryStateInitial extends EntryState {
  const EntryStateInitial();
}

class EntryStateGetEntries extends EntryState {
  final Entries entries;

  EntryStateGetEntries(this.entries);

}

abstract class EntryVerificationState extends Equatable {

  const EntryVerificationState();
}

class EntryVerificationStateInitial extends EntryVerificationState {
  @override
  // TODO: implement props
  List<Object?> get props => [];

  const EntryVerificationStateInitial();
}

class EntryVerificationStateRegisterData extends EntryVerificationState {

  @override
  // TODO: implement props
  List<Object?> get props => [];

  const EntryVerificationStateRegisterData();
}


/*
class EntryStateGetEntries extends EntryState {
  final Entries entries;
  EntryStateGetEntries(this.entries);

  @override
  List<Object?> get props => [];
}*/
