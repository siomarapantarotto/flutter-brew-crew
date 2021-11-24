import 'package:brew_crew/models/app_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // create app user object based on Firebase User.
  AppUser? _userFromFirebase(User user) {
    return user != null ? AppUser(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<AppUser?> get streamUser {
  //Stream<AppUser?> get user {
    return _firebaseAuth
    .authStateChanges()
    .map((User? user) => _userFromFirebase(user!));
  }

  // sign in anonymously
  Future signInAnonymously() async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInAnonymously();
      User? user = userCredential.user;
      return _userFromFirebase(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email & password

  // register with email & password

  // sign out
  Future signOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }    
  }

}
