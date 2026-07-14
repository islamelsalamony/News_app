import 'package:supabase_flutter/supabase_flutter.dart';

class AuthServices {
  final supabase = Supabase.instance.client;

  Future<void> signUp({
    required String email,
    required String password,
    required String username,
  }) async {
    final response = await supabase.auth.signUp(
      email: email,
      password: password,
      data: {"username": username},
    );
    if (response.user == null) {
      throw Exception("Sign Up Failed");
    }
  }

  Future<void> login({required String email, required String password}) async {
    await supabase.auth.signInWithPassword(email: email, password: password);
  }

  Future<void> logout() async {
    await supabase.auth.signOut();
  }
}
