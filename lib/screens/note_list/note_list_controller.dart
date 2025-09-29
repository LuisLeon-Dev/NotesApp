import 'package:notes_app/models/note.dart';
import 'package:notes_app/services/note_service.dart';

class NoteListController {
  final NoteService _service;

  NoteListController([NoteService? service])
    : _service = service ?? NoteService();

  List<Note> get notes => _service.notes;

  void addNote(Note note) => _service.add(note);

  void updateNote(String id, Note note) => _service.update(id, note);

  void deleteNote(String id) => _service.delete(id);
}
