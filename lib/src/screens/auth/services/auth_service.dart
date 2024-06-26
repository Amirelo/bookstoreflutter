import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<UserCredential?> loginWithPasswordService(
    email, password, context) async {
  debugPrint("Handling login ...");
  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    debugPrint("----- Credential: $credential");
    return credential;
  } on FirebaseAuthException catch (e) {
    if (e.code == "user-not-found") {
      debugPrint("This email has not been registered");
    } else if (e.code == "wrong-password") {
      debugPrint("Wrong username or password");
    } else if (e.code == "invalid-email") {
      debugPrint("Email address is badly formatted");
    } else {
      debugPrint("------Error: $e");
    }
    return null;
  }
}

Future<UserCredential> loginWithGoogle() async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

  return await FirebaseAuth.instance.signInWithCredential(credential);
}

Future<UserCredential?> loginWithFacebook() async {
  try {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final OAuthCredential facebookCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
    return FirebaseAuth.instance.signInWithCredential(facebookCredential);
  } catch (error) {
    debugPrint("------Error signing with facebook: $error");
    return null;
  }
}
