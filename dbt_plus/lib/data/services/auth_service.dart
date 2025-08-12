import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/util/result.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  final auth = FirebaseAuth.instance;
  return AuthService(auth);
});

class AuthService {
  AuthService(this._auth);
  final FirebaseAuth _auth;

  Stream<User?> get currentUserStream => _auth.authStateChanges();

  Future<Result<UserCredential>> signInAnon() async {
    try {
      final cred = await _auth.signInAnonymously();
      return Success(cred);
    } catch (e) {
      return Failure(e);
    }
  }

  Future<Result<UserCredential>> signInWithEmail(String email, String password) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return Success(cred);
    } catch (e) {
      return Failure(e);
    }
  }

  Future<void> signOut() => _auth.signOut();
}
