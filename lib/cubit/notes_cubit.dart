import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/note.dart';
import '../repository/notes_repository.dart';

class NotesState {
  final List<Note> notes;
  final bool isLoading;

  NotesState({required this.notes, this.isLoading = false});
}

class NotesCubit extends Cubit<NotesState> {
  final String userId;
  final NotesRepository repo;

  NotesCubit(this.userId, this.repo) : super(NotesState(notes: []));

  Future<void> fetchNotes() async {
    emit(NotesState(notes: [], isLoading: true));
    final notes = await repo.fetchNotes(userId);
    emit(NotesState(notes: notes));
  }

  Future<void> addNote(String text) async {
    await repo.addNote(userId, text);
    fetchNotes();
  }

  Future<void> updateNote(String id, String text) async {
    await repo.updateNote(userId, id, text);
    fetchNotes();
  }

  Future<void> deleteNote(String id) async {
    await repo.deleteNote(userId, id);
    fetchNotes();
  }
}