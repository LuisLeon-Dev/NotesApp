import 'package:flutter/material.dart';
import 'package:notes_app/models/note.dart';

class NoteEditController {
  final TextEditingController titleController;
  final TextEditingController contentController;

  NoteEditController({Note? note})
    : titleController = TextEditingController(text: note?.title ?? ''),
      contentController = TextEditingController(text: note?.content ?? '');

  Note buildNote({required String id}) {
    return Note(
      id: id,
      title: titleController.text,
      content: contentController.text,
    );
  }

  void dispose() {
    titleController.dispose();
    contentController.dispose();
  }
}
