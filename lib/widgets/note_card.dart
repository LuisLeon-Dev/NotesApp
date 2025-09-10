import 'package:flutter/material.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/utils/app_theme.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  final VoidCallback onTap;
  final int colorIndex;

  const NoteCard({
    super.key,
    required this.note,
    required this.onTap,
    required this.colorIndex,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).brightness == Brightness.light
        ? AppTheme.noteColorsLight[colorIndex % AppTheme.noteColorsLight.length]
        : AppTheme.noteColorsDark[colorIndex % AppTheme.noteColorsDark.length];

    return InkWell(
      onTap: onTap,
      child: Card(
        color: color,
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            children: [
              Text(note.title, style: Theme.of(context).textTheme.titleLarge),
              Text(note.content, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
      ),
    );
  }
}
