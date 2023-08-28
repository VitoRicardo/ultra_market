import 'package:ultra_market/models/user_model.dart';
import 'interface_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_failures.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository extends IAuthRepository {
  final FirebaseAuth _firebaseAuth;
  UserModel currentUser = UserModel.empty;
  final GoogleSignIn _googleSignIn;
  AuthRepository({FirebaseAuth? firebaseAuth, GoogleSignIn? googleSignIn})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn.standard();

  ///Essa função possui User como return apenas para print, quando estiver tudo OK ela deve ser do tipo void
  ///Essa função em release deve ser tipada como Future<void> e variável [credential] não deve existir
  @override
  Future<User?> signUp(
      {required String email, required String password}) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const SignUpWithEmailAndPasswordFailure();
    }
  }

  @override
  Future<void> logInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = _firebaseAuth.currentUser!;
      currentUser = UserModel(email: user.email, id: user.uid);
    } on FirebaseAuthException catch (e) {
      throw LogInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithEmailAndPasswordFailure();
    }
  }

  @override
  Future<void> logInWithGoogle() async {
    try {
      late final AuthCredential credential;
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _firebaseAuth.signInWithCredential(credential);
      User user = _firebaseAuth.currentUser!;
      currentUser = UserModel(email: user.email, id: user.uid);
    } on FirebaseAuthException catch (e) {
      throw LogInWithGoogleFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithGoogleFailure();
    }
  }

  @override
  Future<void> logOut() async {
    try {
      /// Implementar google.signout, facebook.signout e apple.signout
      await Future.wait([_firebaseAuth.signOut()]);
    } catch (_) {
      throw LogOutFailure();
    }
  }

  @override
  Stream<User?> get user {
    _firebaseAuth.authStateChanges().map((firebaseUser) {
      currentUser =
          firebaseUser == null ? UserModel.empty : firebaseUser.toUser;
    });
    return _firebaseAuth.userChanges();
  }
}

extension on User {
  UserModel get toUser {
    return UserModel(id: uid, email: email, name: displayName, photo: photoURL);
  }
}
