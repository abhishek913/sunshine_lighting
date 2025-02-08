import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  Future<AuthResponse> signInWithEmailAndPassword(
      String email, String password) async {
    return await _supabaseClient.auth
        .signInWithPassword(email: email, password: password);
  }

  Future<AuthResponse> signUpWithEmailAndPassword(
      String email, String password) async {
    return await _supabaseClient.auth.signUp(email: email, password: password);
  }

  Future<void> signOut() async {
    await _supabaseClient.auth.signOut();
  }

  String? getCurrentUser() {
    final session = _supabaseClient.auth.currentSession;
    final user = session?.user;
    return user?.email;
  }
}
