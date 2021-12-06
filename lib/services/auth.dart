import 'package:flutter/material.dart';
import 'package:brew_crew/models/app_user.dart';
import 'package:brew_crew/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Create app user object based on Firebase User.
  AppUser? _userFromFirebase(User user) {
    // The operand can't be null, so the condition is always true.
    //return user != null ? AppUser(uid: user.uid) : null;
    return AppUser(uid: user.uid);
  }

  // Auth change user stream.
  Stream<AppUser?> get streamUser {
    return _firebaseAuth
        .authStateChanges()
        .map((User? user) => _userFromFirebase(user!));
  }

  // Sign in anonymously.
  Future signInAnonymously() async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInAnonymously();
      User? user = userCredential.user;
      return _userFromFirebase(user!);
    } catch (e) {
      debugPrint('Inside auth.dart - error: ' + e.toString());
      return null;
    }
  }

  // Sign in with email & password.
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      return _userFromFirebase(user!);
    } catch (e) {
      debugPrint('Inside auth.dart - error: ' + e.toString());
      return null;
    }
  }

  // Register with email & password.
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;

      // create a new document for the user with the uid
      await DatabaseService(uid: user!.uid).updateUserData('new crew member', '0', 100);
      debugPrint('Inside auth.dart - user.uid: ' + user.uid);
      return _userFromFirebase(user);
    } catch (e) {
      debugPrint('Inside auth.dart - error: ' + e.toString());
      return null;
    }
  }

  // Sign out.
  Future signOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch (e) {
      debugPrint('Inside auth.dart - error: ' + e.toString());
      return null;
    }
  }

}
