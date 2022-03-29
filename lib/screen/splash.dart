import 'package:flutter/material.dart';
import 'package:project/screen/sign_in.dart';
import 'package:project/settings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    _navigatetohome();
  }

  _navigatetohome()async{
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context)=>SignInScreen()));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mBlue,
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Image.asset("assets/Logo.png"),
            width: 130,
            height: 130,
          ),
        ],
      )
      ),
    );
  }
}