import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'screens/note_list/note_list_screen.dart';
import 'utils/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = false;
    return MaterialApp(
      title: 'Take a Note',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: NoteListScreen(),
    );
  }
}
