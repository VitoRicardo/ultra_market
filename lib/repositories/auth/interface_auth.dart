import 'package:firebase_auth/firebase_auth.dart';
import 'package:ultra_market/models/user_model.dart';

abstract class IAuthRepository {
  // Stream<UserModel> get currentSignUser;
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

  Future<void> logOut();
}
