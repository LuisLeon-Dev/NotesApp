import 'package:notes_app/models/note.dart';
import 'package:notes_app/services/supabase_service.dart';

class NoteService {
  final _client = SupabaseService.client;

  Future<List<Note>> getAll() async {
    final response = await _client
        .from('notes')
        .select('*')
        .order('created_at', ascending: false);
    return (response as List).map((data) => Note.fromMap(data)).toList();
  }

  Future<void> add(Note note) async {
    await _client.from('notes').insert(note.toMap());
  }

  Future<void> update(String id, Note note) async {
    await _client.from('notes').update(note.toMap()).eq('id', id);
  }

  Future<void> delete(String id) async {
    await _client.from('notes').delete().eq('id', id);
  }
}
