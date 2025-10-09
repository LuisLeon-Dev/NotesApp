import 'package:notes_app/models/note.dart';

class NoteService {
  final List<Note> _notes = [];

  List<Note> get notes => List.unmodifiable(_notes);

  void add(Note note) {
    _notes.add(note);
  }

  void update(String id, Note updated) {
    final index = _notes.indexWhere((n) => n.id == id);
    if (index != -1) {
      _notes[index] = updated;
    }
  }

  void delete(String id) {
    _notes.removeWhere((n) => n.id == id);
  }

  //TODO: utilizar Supabase como base de datos
}
