import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_app/models/user.dart';

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Users _userFromFirebase(User user) {
    print("${user.uid} is sign up");
    return user != null ? Users(userId: user.uid) : null;
  }

  Future signInwithEmailPass(String email, String password) async {
    try {
      var result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      User firebaseUser = result.user;

      return _userFromFirebase(firebaseUser);
    } catch (e) {
      print(e.toString());
    }
  }

  Future signUpwithEmailPass(String email, String password) async {
    try {
      var result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print("ok");
      return _userFromFirebase(result.user);
    } catch (e) {
      print(e.toString());
    }
  }

  Future resetPass(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
    }
  }

  Future SignOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
