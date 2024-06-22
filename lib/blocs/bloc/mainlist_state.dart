part of 'mainlist_bloc.dart';

abstract class MainlistState {}

class MainlistInitial extends MainlistState {}

class NotesLoaded extends MainlistState {
  final List<NoteModel> notes;

  NotesLoaded(this.notes);
}

class NotesDeleted extends MainlistState {}
