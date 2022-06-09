import 'package:flutter/material.dart';
import 'package:project/screen/main.dart';
import 'package:project/screen/sign_up.dart';
import 'package:project/settings.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      backgroundColor: mGraywhite,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            Expanded(
              flex: 3,
              child: Padding(
                padding: kDefaultPadding,
                child: Wrap(
                  children: [
                    Text(
                      'Selamat Datang Kembali',
                      style: titleText,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Login untuk lanjut',
                      style: subTitle,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    formInput(
                      marginTop: 0,
                      marginButton: 0,
                      textValue: 'Nomor Hp atau Email',
                      obscureText: false,
                      checkValidator: (val) {
                        if (val == null) {
                          return 'tidak boleh kosong';
                        }
                        if (val.length < 3) {
                          return 'Minimal 3 karakter';
                        }
                        return null;
                      },
                    ),
                    formInput(
                      marginTop: 20,
                      marginButton: 0,
                      textValue: 'Password',
                      obscureText: true,
                      checkValidator: (val) {
                        if (val == null) {
                          return 'password harus diisi';
                        }
                        if (val.length < 6) {
                          return 'password minimal 6 karakter';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 4,
                child: Padding(
                  padding: kDefaultPadding,
                  child: Container(
                    width: double.infinity,
                    child: Row(
                      children: [
                        Container(
                          width: 150,
                          child: Column(
                            children: [
                              Text(
                                'Dont have account?',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 180, 180, 180),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Row(
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
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Here',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 180, 180, 180),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                width: 150,
                                height: 55,
                                child: ElevatedButton(
                                  child: Text('Sign In'),
                                  onPressed: () {
                                    if (formkey.currentState != null) {
                                      if (formkey.currentState!.validate()) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content:
                                                    Text('Berhasil Sign In')));
                                        Future.delayed(Duration(seconds: 1),
                                            () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(builder: (_) {
                                            return mainApp();
                                          }));
                                        });
                                      } else {
                                        print('ada inputan belum valid');
                                      }
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: mBlue,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      textStyle: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )),
            Expanded(
              flex: 1,
              child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: mGraywhite),
                  child: GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Forget Password',
                          style: TextStyle(fontSize: 12, color: mGray),
                        ),
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class formInput extends StatelessWidget {
  final String textValue;
  final bool obscureText;
  final double marginTop;
  final double marginButton;
  final String? Function(String?)? checkValidator;

  const formInput({
    required this.textValue,
    required this.obscureText,
    required this.marginTop,
    required this.marginButton,
    this.checkValidator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kDefaultPadding,
      child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: marginTop, bottom: marginButton),
          child: TextFormField(
            key: GlobalKey<FormState>(),
            controller: TextEditingController(),
            decoration: InputDecoration(
              enabledBorder: ActiveOutLine,
              focusedBorder: PressOutLine,
              filled: true,
              fillColor: Colors.white,
              hintText: textValue,
            ),
            autofocus: false,
            obscureText: obscureText,
            validator: checkValidator,
          )),
    );
  }
}
