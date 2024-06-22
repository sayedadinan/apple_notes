import 'package:bloc/bloc.dart';
import 'package:apple_notes/data/modal/note_modal.dart';
import 'package:apple_notes/data/repositery/data_repo.dart';
part 'mainlist_event.dart';
part 'mainlist_state.dart';

class MainlistBloc extends Bloc<MainlistEvent, MainlistState> {
  final DataStorage _dataStorage = DataStorage();

  MainlistBloc() : super(MainlistInitial()) {
    on<DeleteItem>(_onDeleteItem);
    on<LoadNotes>(_onLoadNotes);
    on<SearchNotes>(_onSearchNotes);
  }

  void _onDeleteItem(DeleteItem event, Emitter<MainlistState> emit) async {
    try {
      await _dataStorage.deleteData(event.id);
      add(LoadNotes());
      emit(NotesDeleted());
    } catch (e) {
      print('Error deleting note: $e');
    }
  }

  void _onLoadNotes(LoadNotes event, Emitter<MainlistState> emit) async {
    try {
      final data = await _dataStorage.getAllData();
      final List<NoteModel> notes = [];
      for (int i = 0; i < data.length; i++) {
        notes.add(NoteModel(
            title: data[i]['title'],
            notes: data[i]['notes'],
            date: data[i]['date'],
            id: data[i]['id']));
      }
      emit(NotesLoaded(notes));
    } catch (e) {
      print('Error loading notes: $e');
    }
  }

  void _onSearchNotes(SearchNotes event, Emitter<MainlistState> emit) async {
    try {
      final data = await _dataStorage.searchData(event.query);
      final List<NoteModel> notes = [];
      for (int i = 0; i < data.length; i++) {
        notes.add(NoteModel(
            title: data[i]['title'],
            notes: data[i]['notes'],
            date: data[i]['date'],
            id: data[i]['id']));
      }
      emit(NotesLoaded(notes));
    } catch (e) {
      print('Error searching notes: $e');
    }
  }
}
