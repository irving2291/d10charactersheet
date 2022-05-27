import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository {
  Future<User?> get user;

  Future<String?> signIn({required String email, required String password});

  Future<String> signUpWithGoogle();

  Future<String> signUpWithApple();

  Future<String> signInAnonymously();
}