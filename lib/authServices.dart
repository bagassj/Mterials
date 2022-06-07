import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';


class AuthServices{
  final auth = FirebaseAuth.instance;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void signIn()async{
    try{
      await auth.signInWithEmailAndPassword(email: email.text, password: password.text).then((value) => {
        print("User is Logged In")
      });
    }
    catch (e){
      print(e);
    }
  }

  void signUp()async{
    try{
      await auth.createUserWithEmailAndPassword(email: email.text, password: password.text).then((value) => {
        print("User is Registered")
      });
    }
    catch (e){
      print(e);
    }
  }

}