import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

var db = FirebaseFirestore.instance;

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

  UserCredential res =
      await FirebaseAuth.instance.signInWithCredential(credential);
  if (res.user != null) {
    debugPrint("Email: ${res.user!.email!}");
    if (!await emailExisted(res.user!.email!)) {
      await createUserData(res.user!.email!, res.user!.displayName!);
    }
  }
  return res;
}

Future<UserCredential?> loginWithFacebook() async {
  try {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final OAuthCredential facebookCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
    UserCredential res =
        await FirebaseAuth.instance.signInWithCredential(facebookCredential);

    if (res.user != null) {
      if (!await emailExisted(res.user!.email!)) {
        await createUserData(res.user!.email!, res.user!.displayName!);
      }
    }
    return res;
  } catch (error) {
    debugPrint("------Error signing with facebook: $error");
    return null;
  }
}

Future<UserCredential?> signUpWithPassword(
    String email, String password) async {
  var newUser = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: password);
  createUserData(email, email.split("@")[0]);
  return newUser;
}

void signOut() {
  FirebaseAuth.instance.signOut();
  GoogleSignIn().signOut();
  FacebookAuth.instance.logOut();
}

Future<bool> emailExisted(String email) async {
  bool existed = false;
  await db.collection("users").get().then((querySnapshot) {
    for (var i = 0; i < querySnapshot.size; i++) {
      var id = querySnapshot.docs[i].id;
      if (email.compareTo(id) == 0) {
        debugPrint("------AuthService - EmailExisted: True");
        existed = true;
        break;
      }
    }
  });
  return existed;
}

Future<bool> createUserData(String email, String username) async {
  try {
    db.collection("users").doc(email).set({
      "username": username,
    });
    return true;
  } catch (error) {
    debugPrint("------AuthService CreateUserData error: $error");
    return false;
  }
}
