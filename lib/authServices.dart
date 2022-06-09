import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

static FirebaseAuth _auth = FirebaseAuth.instance;

static Future<SignInSignUpResult> createUser({String email, String pass}) async {
  try {
    AuthResult result = await
_auth.createUserWithEmailAndPassword(email: email, password: pass);
    return SignInSignUpResult(user: result.user);
  } catch (e) {
    return SignInSignUpResult(message: e.toString());
  }
}
class SignInSignUpResult {
  final FirebaseUser user;
  final String message;
  SignInSignUpResult({this.user, this.message});
}
