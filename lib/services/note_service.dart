import 'package:notes_app/models/note.dart';
import 'package:notes_app/services/supabase_service.dart';

class NoteService {
  final _client = SupabaseConfig.client;

  Future<List<Note>> fetchNotes() async {
    final response = await _client.from('notes').select();
    return (response as List).map((note) => Note.fromJson(note)).toList();
  }

  Future<void> add(Note note) async {
    await _client.from('notes').insert(note.toJson());
  }

  Future<void> update(String id, Note updated) async {
    await _client.from('notes').update(updated.toJson()).eq('id', id);
  }

  Future<void> delete(String id) async {
    await _client.from('notes').delete().eq('id', id);
  }
}
