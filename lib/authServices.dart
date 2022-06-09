import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/screen/main.dart';
import 'package:project/screen/sign_in.dart';
import 'package:project/screen/sign_up.dart';
import 'package:project/settings.dart';



class AuthServices{
  final auth = FirebaseAuth.instance;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void signIn(context)async{
    try{
      showDialog(context: context, builder: (context){
        return AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Center(
            child: CircularProgressIndicator()
          ),
        );
      });
      

      await auth.signInWithEmailAndPassword(email: email.text, password: password.text).then((value) => {
        print("User is Logged In"),
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => mainApp()), (route) => false)
      });
    }
    catch (e){
      showDialog(context: context, builder: (context){
        Future.delayed(Duration(seconds: 3), () {Navigator.of(context).push(MaterialPageRoute(builder: (_){
          return SignInScreen();
        }));});
        return AlertDialog(
          title: Text(
            "Incorrect your email and password",
            style: subTitle,
          ),
        );
      });
    }
  }

  void signUp(context)async{
    try{
      showDialog(context: context, builder: (context){
        return AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Center(
            child: CircularProgressIndicator()
          ),
        );
      });

      await auth.createUserWithEmailAndPassword(email: email.text, password: password.text).then((value) => {
        print("User is Registered"),
        Navigator.push(context, MaterialPageRoute(builder: (e) => SignInScreen( ))),
      });
    }
    catch (e){
      showDialog(context: context, builder: (context){
        Future.delayed(Duration(seconds: 3), () {Navigator.of(context).push(MaterialPageRoute(builder: (_){
          return SignUpScreen();
        }));});
        return AlertDialog(
          title: Text(
            "Your data is wrong",
            style: subTitle,
          ),
        );
      });
    }
  }

  void logOut(context)async{
    await auth.signOut();
      print("User is Logout");
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (c) => SignInScreen()), (route) => false);
  }

}