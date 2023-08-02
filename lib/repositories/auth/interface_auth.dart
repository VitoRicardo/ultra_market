import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthRepository {
  Stream<User?> get user;
  Future<User?> signUp({
    required String email,
    required String password,
  });

  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> logInWithGoogle();

  Future<void> logInWithFacebook();

  Future<void> logInWithApple();

  Future<void> logOut();
}
