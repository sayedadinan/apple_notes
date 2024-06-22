part of 'mainlist_bloc.dart';

sealed class MainlistEvent {}

class DeleteItem extends MainlistEvent {
  final int id;

  DeleteItem({required this.id});
}

class LoadNotes extends MainlistEvent {}

class SearchNotes extends MainlistEvent {
  final String query;

  SearchNotes({required this.query});
}
