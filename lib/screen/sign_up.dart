import 'package:flutter/material.dart';
// import 'package:project/screen/sign_in.dart';
import 'package:project/screen/main.dart';
import 'package:project/settings.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: mGraywhite,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
      body: Padding(
        padding: kDefaultPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
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
            const SizedBox(
              height: 50,
            ),
            FormMethod(20, 'Email'),
            FormMethod(20, 'Nomor Hp'),
            FormMethod(20, 'Password'),
            FormMethod(50, 'Masukkan Ulang Password'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 230,
                  height: 55,
                  child: ElevatedButton(
                    child: Text('Sign Up'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Main(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        primary: mBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        textStyle: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Row FormMethod(MarginBottom, TextValue) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: 330,
            margin: EdgeInsets.only(bottom: MarginBottom),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: ActiveOutLine,
                focusedBorder: PressOutLine,
                filled: true,
                fillColor: Colors.white,
                hintText: TextValue,
              ),
              autofocus: false,
            )),
      ],
    );
  }
}
