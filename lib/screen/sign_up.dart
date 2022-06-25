import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/authServices.dart';
import 'package:project/dbServices.dart';
import 'package:project/settings.dart';
import 'package:project/dataClass.dart';
import 'package:project/dbServices.dart';



class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final ctrlName = TextEditingController();
  final ctrlNope = TextEditingController();
  var formkey = GlobalKey<FormState>();
  AuthServices authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: mGraywhite,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 180, 180, 180),
          ),
        ),
      ),
      
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50.0),
            Expanded(
              flex: 3,
              child: Padding(
                padding: kDefaultPadding,
                child: Wrap(
                  children: [
                    Text(
                      'Selamat Bergabung di MTerials',
                      style: titleText,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Register untuk lanjut',
                      style: subTitle,
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              flex: 6,
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    Padding(
                      padding: kDefaultPadding,
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 0.0, bottom: 20.0),
                        child: TextFormField(
                          controller: ctrlName,
                          decoration: InputDecoration(
                            enabledBorder: ActiveOutLine,
                            focusedBorder: PressOutLine,
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Nama',
                          ),
                          autofocus: false,
                          obscureText: false,
                        )
                      ),    
                    ),

                    Padding(
                      padding: kDefaultPadding,
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 0.0, bottom: 20.0),
                        child: TextFormField(
                          controller: authServices.email,
                          decoration: InputDecoration(
                            enabledBorder: ActiveOutLine,
                            focusedBorder: PressOutLine,
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Email',
                          ),
                          autofocus: false,
                          obscureText: false,
                        )
                      ),    
                    ),

                    Padding(
                      padding: kDefaultPadding,
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 0.0, bottom: 20.0),
                        child: TextFormField(
                          controller: ctrlNope,
                          decoration: InputDecoration(
                            enabledBorder: ActiveOutLine,
                            focusedBorder: PressOutLine,
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Nomor Hp',
                          ),
                          autofocus: false,
                          obscureText: false,
                        )
                      ),    
                    ),

                    Padding(
                      padding: kDefaultPadding,
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 0.0, bottom: 20.0),
                        child: TextFormField(
                          controller: authServices.password,
                          decoration: InputDecoration(
                            enabledBorder: ActiveOutLine,
                            focusedBorder: PressOutLine,
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Password',
                          ),
                          autofocus: false,
                          obscureText: false,
                        )
                      ),    
                    ),
                  ],
                )
              ),
            ),

            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                width: 230,
                height: 60,
                child: ElevatedButton(
                  child: Text('Sign Up'),
                  onPressed: () {
                    final dt = Users(name: ctrlName.text, mail: authServices.email.text, nope: ctrlNope.text);
                    if(authServices.email != "" && authServices.password != "" && ctrlName != "" && ctrlNope != ""){
                      authServices.signUp(context);
                      database.addData(users: dt);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      primary: mBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      textStyle: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
              )
            ),
          ],
        ),
      ),
    );
  }
}


