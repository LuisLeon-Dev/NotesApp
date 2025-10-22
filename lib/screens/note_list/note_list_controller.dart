import 'package:notes_app/models/note.dart';
import 'package:notes_app/services/note_service.dart';

class NoteListController {
  final NoteService _service = NoteService();

  Future<List<Note>> loadNotes() => _service.fetchNotes();
  Future<void> addNote(Note note) => _service.add(note);
  Future<void> updateNote(String id, Note note) => _service.update(id, note);
  Future<void> deleteNote(String id) => _service.delete(id);
}
