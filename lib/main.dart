import 'package:flutter/material.dart';
import 'package:notes_app/app.dart';
import 'package:notes_app/services/supabase_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseConfig.initialize();
  runApp(const MyApp());
}
