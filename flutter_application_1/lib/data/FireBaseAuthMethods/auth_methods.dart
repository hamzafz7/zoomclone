import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/constants.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthMethods {
  static final firebaseAuth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  static Stream<User?> get authchanged => firebaseAuth.authStateChanges();
  static User? get user => firebaseAuth.currentUser;
  static Future signout() async {
    return await firebaseAuth.signOut();
  }

  Future<bool> googleSignIn(BuildContext context) async {
    bool res = false;
    try {
      final GoogleSignInAccount? googleuser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleauth =
          await googleuser?.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleauth?.accessToken, idToken: googleauth?.idToken);
      UserCredential userCredential =
          await firebaseAuth.signInWithCredential(credential);
      User? user = userCredential.user;
      if (user != null) {
        res = true;
        if (userCredential.additionalUserInfo!.isNewUser) {
          await firestore.collection("users").doc(user.uid).set({
            "username": user.displayName,
            "uid": user.uid,
            "photo": user.photoURL
          });
        }
      }
      return res;
    } on FirebaseAuthException catch (E) {
      showSnackbar(context, E.toString());
      return res;
    }
  }
}
