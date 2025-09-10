import 'package:flutter/material.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/screens/note_edit.dart';
import 'package:notes_app/widgets/note_card.dart';

class NoteListScreen extends StatefulWidget {
  const NoteListScreen({super.key});

  @override
  State<NoteListScreen> createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  final List<Note> _notes = [];

  Future<void> _openEditor({Note? note, int? index}) async {
    final result = await Navigator.push<Note?>(
      context,
      MaterialPageRoute(builder: (context) => NoteEditScreen(note: note)),
    );

    if (result == null) return;

    setState(() {
      if (index != null) {
        _notes[index] = result;
      } else {
        _notes.add(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mis notas')),
      body: _notes.isEmpty
          ? Center(
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
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _notes.length,
              itemBuilder: (context, index) {
                final note = _notes[index];
                return NoteCard(
                  note: note,
                  colorIndex: index,
                  onTap: () => _openEditor(note: note, index: index),
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
