import 'package:flutter/material.dart';
import 'package:hol_tuwaiq/services/supabase/supabase.dart';
import 'package:hol_tuwaiq/views/admin_view/home_screen/home_screen.dart';
import 'package:hol_tuwaiq/views/user_view/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseIntegration().init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeScreenAdmin());
  }
}
