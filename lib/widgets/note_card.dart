import 'package:flutter/material.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/utils/app_theme.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  final int colorIndex;
  final VoidCallback onTap;

  const NoteCard({
    super.key,
    required this.note,
    required this.colorIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    final color = isLight
        ? AppTheme.noteColorsLight[colorIndex % AppTheme.noteColorsLight.length]
        : AppTheme.noteColorsDark[colorIndex % AppTheme.noteColorsDark.length];

    return SizedBox(
      width: double.infinity,
      height: 140,
      child: Card(
        color: color,
        shape: Theme.of(context).cardTheme.shape,
        elevation: Theme.of(context).cardTheme.elevation,
        margin: Theme.of(context).cardTheme.margin,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  note.title.isEmpty ? 'Sin título' : note.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  note.content.isEmpty ? 'Sin contenido' : note.content,
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
