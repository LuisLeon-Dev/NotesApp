import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/screens/note_list/note_list_controller.dart';
import 'package:notes_app/widgets/note_card.dart';
import 'package:notes_app/screens/note_edit/note_edit_screen.dart';

class NoteListScreen extends StatefulWidget {
  const NoteListScreen({super.key});

  @override
  State<NoteListScreen> createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  final NoteListController _controller = NoteListController();
  final Uuid _uuid = const Uuid();

  late Future<List<Note>> _futureNotes;

  @override
  void initState() {
    super.initState();
    _futureNotes = _controller.loadNotes();
  }

  Future<void> _refreshNotes() async {
    setState(() {
      _futureNotes = _controller.loadNotes();
    });
  }

  Future<void> _openEditor({Note? note}) async {
    final result = await Navigator.push<Note?>(
      context,
      MaterialPageRoute(builder: (context) => NoteEditScreen(note: note)),
    );

    if (result == null) return;

    if (note != null) {
      // editar nota existente
      await _controller.updateNote(note.id, result);
    } else {
      // crear nueva nota con ID generado localmente
      final newNote = Note(
        id: _uuid.v4(),
        title: result.title,
        content: result.content,
      );
      await _controller.addNote(newNote);
    }

    _refreshNotes();
  }

  Future<void> _deleteNoteWithUndo(BuildContext ctx, Note note) async {
    await _controller.deleteNote(note.id);
    _refreshNotes();

    ScaffoldMessenger.of(ctx).clearSnackBars();
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content: const Text('Nota eliminada'),
        action: SnackBarAction(
          label: 'Deshacer',
          onPressed: () async {
            await _controller.addNote(note);
            _refreshNotes();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mis notas')),
      body: FutureBuilder<List<Note>>(
        future: _futureNotes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final notes = snapshot.data ?? [];

          if (notes.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/images/rafiki.png', width: 200),
                  const SizedBox(height: 16),
                  Text(
                    'Agrega una nota',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: _refreshNotes,
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final note = notes[index];
                return Dismissible(
                  key: ValueKey(note.id),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    color: Colors.red,
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed: (_) => _deleteNoteWithUndo(context, note),
                  child: NoteCard(
                    note: note,
                    colorIndex: index,
                    onTap: () => _openEditor(note: note),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openEditor(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
