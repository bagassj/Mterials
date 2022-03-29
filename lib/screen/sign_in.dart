import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project/settings.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({ Key? key }) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: mGraywhite,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selamat Datang',
              style: titleText,
            ),
            Text(
              'Kembali',
              style: titleText,
            ),

            const SizedBox(
              height: 5,
            ),

            Text(
              'Login untuk lanjut',
              style: subTitle,
            ),

            const SizedBox(
              height: 150,
            ),

            Container(
            width: 350,
            child: TextField(
                decoration: InputDecoration( 
                  enabledBorder: ActiveOutLine,
                  focusedBorder:PressOutLine,
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Nomor HP atau Email',
                ),
                autofocus: false,
            )
            ),

            const SizedBox(
              height: 20,
            ),

            Container(
            width: 350,
            child: TextField(
                decoration: InputDecoration(
                  enabledBorder: ActiveOutLine,
                  focusedBorder: PressOutLine,
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Password',
                ),
                autofocus: false,
            )
            ),

            const SizedBox(
              height: 20,
            ),

            Container(
              alignment: Alignment.center,
              width: 200,
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: mBlue,
              ),
              child: const Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),

            // Container(
            //   padding: const EdgeInsets.all(10.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text('Forget password?',style: TextStyle(fontSize: 12.0),),
            //       RaisedButton(
            //         child: Text('Login'),
            //         color: Color(0xffEE7B23),
            //         onPressed: (){},
            //       ),
            //     ],
            //   ),
            // ),

          ],

        ),

      ),
    );
  }
}