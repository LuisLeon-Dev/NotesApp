import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  static Future<void> initialize() async {
    try {
      await dotenv.load(fileName: ".env");
      print('✅ .env loaded');

      await Supabase.initialize(
        url: dotenv.env['SUPABASE_URL']!,
        anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
      );

      print('✅ Supabase initialized successfully');
    } catch (e, stack) {
      print('❌ Error initializing Supabase: $e');
      print(stack);
    }
  }

  static SupabaseClient get client => Supabase.instance.client;
}
