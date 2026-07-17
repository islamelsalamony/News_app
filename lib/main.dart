import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novanews/core/cache/cache_user_repo.dart';
import 'package:novanews/features/auth/cubit/appauth/appauth_cubit.dart';
import 'package:novanews/features/auth/presentation/screens/on_boarding_start.dart';
import 'package:novanews/features/auth/presentation/screens/splash_screen.dart';
import 'package:novanews/features/home/cubit/product_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheUserRepo.init();

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
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppAuthCubit>(create: (context) => AppAuthCubit()),
        BlocProvider(create: (context) => ProductCubit()..getAllProduct()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NovaNews',

        initialRoute: '/',

        routes: {
          '/': (context) => const SplashScreen(),
          '/home': (context) => const OnboardingScreen(),
        },
      ),
    );
  }
}
