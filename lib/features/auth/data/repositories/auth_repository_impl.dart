import '../../domin/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../datasource/firebase_auth_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthDataSource _firebaseAuthDataSource;

  AuthRepositoryImpl(this._firebaseAuthDataSource);

  @override
  Future signUp(String name, String email, String password) async {
    try {
      final UserCredential userCredential = await _firebaseAuthDataSource
          .signUpWithEmailPassword(name, email, password);
      await _firebaseAuthDataSource.sendEmailVerification();
      return userCredential.user;
    } catch (e) {
      throw Exception("Error signing up: $e");
    }
  }

  @override
  Future signIn(String email, String password) async {
    try {
      final UserCredential userCredential = await _firebaseAuthDataSource
          .signInWithEmailPassword(email, password);
      return userCredential.user;
    } catch (e) {
      throw Exception("Error signing in: $e");
    }
  }

  @override
  Future<void> sendVerificationEmail() async {
    await _firebaseAuthDataSource.sendEmailVerification();
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuthDataSource.signOut();
  }

  @override
  Future signInWithGoogle() async {
    try {
      final UserCredential userCredential =
          await _firebaseAuthDataSource.signInWithGoogle();
      final User? firebaseUser = userCredential.user;
      if (firebaseUser == null) throw Exception("Google sign-in failed");
      return firebaseUser;
    } catch (e) {
      throw Exception("Error signing in with Google: $e");
    }
  }

  @override
  Future updateUserProfile(String name ,String uId) async {
    try {
      await _firebaseAuthDataSource.updateUserProfile(name ,uId);
    } catch (e) {
      throw Exception("Error update user profile: $e");
    }
  }
}
