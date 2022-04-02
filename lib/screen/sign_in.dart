import 'package:flutter/material.dart';
import 'package:project/screen/sign_up.dart';
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
        body: Padding(
          padding: kDefaultPadding,
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

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 330,
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
              ],
            ),

            SizedBox(
              height: 20,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 330,
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
              ],
            ),

            SizedBox(
              height: 50,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 35),
                        child: Text(
                          'Dont have account?',
                          style: TextStyle(
                            color: Color.fromARGB(255, 180, 180, 180),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),

                      Container(
                         child: Row(  
                           children: [                            
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUpScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: mBlue,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Text(
                                'Here',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 180, 180, 180),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                           ],
                         )
                      )
                    ],
                  ),
                ),
                
                Container(
                  width: 150,
                  height: 55,
                  child: ElevatedButton(
                    child: Text('Sign In'),
                    onPressed: () {},
                    
                    style: ElevatedButton.styleFrom(
                      primary: mBlue,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100),),
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      )
                    ),
                  ),
                ),

              ],
            ),
            
            Container(
              margin: EdgeInsets.only(top: 300),
              alignment: Alignment.bottomCenter,
              child: Text(
                'Forget Password',
                style: TextStyle(
                  color: mGray,
                ),
              ),
            )

            ],
          ),
        ),
    );
  }
}