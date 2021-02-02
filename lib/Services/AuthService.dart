import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wave_mobile_app/models/RegisterUser.dart';
import 'package:wave_mobile_app/models/User.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final firestoreInstance = FirebaseFirestore.instance;

  LocalUser _userFromFireBaseUser(User user) {
    return user != null ? LocalUser(uid: user.uid) : null;
  }

  Stream<LocalUser> get user {
    return _auth.authStateChanges().map(_userFromFireBaseUser);
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFireBaseUser(user);
    } on FirebaseAuthException catch (e) {
      print("INVALID USER CREDENTIALS : " + e.toString());
      return null;
    }
  }

  Future registerWithEmailAndPassword(RegisterUser regUser) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: regUser.email, password: regUser.password);
      User user = result.user;

      firestoreInstance.collection("users").doc(result.user.uid).set({
        'userName': regUser.userName,
        'mobileNumber': regUser.mobileNumber,
        'email': regUser.email,
        'id': result.user.uid
      });
      return _userFromFireBaseUser(user);
    } catch (e) {
      print("ERROR WHILE CREATING A USER : " + e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future changePassword(String password) async{
   //Create an instance of the current user. 
    User user = _auth.currentUser;
   
    //Pass in the password to updatePassword.
    user.updatePassword(password).then((_){
      print("Successfully changed password");
    }).catchError((error){
      print("Password can't be changed" + error.toString());
      //This might happen, when the wrong password is in, the user isn't found, or if the user hasn't logged in recently.
    });
  }
}
