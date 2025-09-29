import 'package:flutter/material.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/screens/note_edit/note_edit_controller.dart';

class NoteEditScreen extends StatefulWidget {
  final Note? note;
  const NoteEditScreen({super.key, this.note});

  @override
  State<NoteEditScreen> createState() => _NoteEditScreenState();
}

class _NoteEditScreenState extends State<NoteEditScreen> {
  late final NoteEditController _controller;

  @override
  void initState() {
    super.initState();
    _controller = NoteEditController(note: widget.note);
  }

  void _saveNote() {
    // si no hay texto, cerramos sin devolver nada
    if (_controller.titleController.text.isEmpty &&
        _controller.contentController.text.isEmpty) {
      Navigator.pop(context);
      return;
    }

    // construimos la nota manteniendo el id si existía
    final note = _controller.buildNote(id: widget.note?.id ?? '');
    Navigator.pop(context, note);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note == null ? 'Nueva nota' : 'Editar nota'),
        actions: [
          IconButton(icon: const Icon(Icons.check), onPressed: _saveNote),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller.titleController,
              style: Theme.of(context).textTheme.titleLarge,
              decoration: const InputDecoration(
                hintText: 'Título',
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: TextField(
                controller: _controller.contentController,
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: const InputDecoration(
                  hintText: 'Escribe tu nota...',
                  border: InputBorder.none,
                ),
                maxLines: null,
                expands: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
