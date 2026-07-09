import 'package:flutter/material.dart';
import 'package:novanews/presentation/screens/on_boarding_start.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'presentation/screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://jqkgshngoruxfllixebc.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Impxa2dzaG5nb3J1eGZsbGl4ZWJjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODM1MzI5OTcsImV4cCI6MjA5OTEwODk5N30.QQXjiC4Fg2HpnJEC5ZgwipBawHaC8xDptie_--Ru7-w",
  );
  runApp(const NovaNewsApp());
}

class NovaNewsApp extends StatelessWidget {
  const NovaNewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NovaNews',

      initialRoute: '/',

      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const OnboardingScreen(),
      },
    );
  }
}
