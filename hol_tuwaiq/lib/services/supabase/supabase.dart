
import 'package:hol_tuwaiq/model/question_model.dart';
import 'package:hol_tuwaiq/model/topics_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part './method/load_data.dart';

class SupabaseIntegration {
  static final supabase = Supabase.instance.client;

  init() async {
    await Supabase.initialize(
      url: 'https://xfososihdyixgyrewlrw.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inhmb3Nvc2loZHlpeGd5cmV3bHJ3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzcwNjMzNzAsImV4cCI6MjA1MjYzOTM3MH0.wrZ3OqbWpI8u9CpJpL6If0jgk_FjqSHc8ZQZwP5nDmg',
    );
  }
}
