// firebase_auth_datasource.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:talent_space_test/core/helpers/local_storage.dart';

class FirebaseAuthDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<UserCredential> signUpWithEmailPassword(
      String name, String email, String password) async {
    UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);

    await addUserDataToFirestore(name, userCredential.user, password);
    await storeUserLocally(userCredential.user!, name);
    return userCredential;
  }

  Future<UserCredential> signInWithEmailPassword(
      String email, String password) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      throw Exception("Google sign-in was cancelled.");
    }
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    UserCredential userCredential =
        await _firebaseAuth.signInWithCredential(credential);

    await addUserDataToFirestore(
        userCredential.user!.displayName.toString(), userCredential.user, '');
    await storeUserLocally(userCredential.user!, '');
    return userCredential;
  }

  Future<void> addUserDataToFirestore(
      String name, User? user, String password) async {
    if (user != null) {
      try {
        String? fcmToken = await FirebaseMessaging.instance.getToken();
        await _firestore.collection('users').doc(user.uid).set({
          'uid': user.uid,
          'name': name,
          'email': user.email,
          'createdAt': Timestamp.now(),
          'fcmToken': fcmToken,
        });
      } catch (e) {
        debugPrint('Error adding user data to Firestore: $e');
      }
    }
  }

  Future<void> sendEmailVerification() async {
    User? user = _firebaseAuth.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  Future<void> storeUserLocally(User user, String name) async {
    await SharedPrefHelper.setData('uid', user.uid);
    await SharedPrefHelper.setData('name', user.displayName ?? name);
    await SharedPrefHelper.setData('email', user.email ?? '');
    await SharedPrefHelper.setData(
        'fcmToken', await FirebaseMessaging.instance.getToken() ?? '');
  }

  Future<Map<String, String>> getUserDataFromLocal() async {
    return {
      'uid': await SharedPrefHelper.getString('uid') ?? '',
      'name': await SharedPrefHelper.getString('name') ?? '',
      'email': await SharedPrefHelper.getString('email') ?? '',
      'fcmToken': await SharedPrefHelper.getString('fcmToken') ?? '',
    };
  }

  Future<void> updateUserProfile(String name, String uId) async {
    try {
      await _firestore.collection('users').doc(uId).update({'name': name});
      await SharedPrefHelper.setData('name', name);
    } catch (e) {
      throw Exception("Error updating user profile: $e");
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await SharedPrefHelper.clearAllData();
  }
}
