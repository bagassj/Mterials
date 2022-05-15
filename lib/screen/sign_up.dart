import 'package:flutter/material.dart';
import 'package:project/screen/main.dart';
import 'package:project/settings.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var formkey = GlobalKey<FormState>();

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
                    formInput(
                      marginTop: 0,
                      marginButton: 20,
                      textValue: 'Email',
                      obscureText: false,
                      checkValidator: (val) {
                        if (val == null) {
                          return 'Tidak Boleh Kosong';
                        }
                        if (val.length < 3) {
                          return 'Minimal 3 karakter';
                        }
                        return null;
                      },
                    ),

                    formInput(
                      marginTop: 0,
                      marginButton: 20,
                      textValue: 'Nomor Hp',
                      obscureText: false,
                      checkValidator: (val) {
                        if (val == null) {
                          return 'Tidak Boleh Kosong';
                        }
                        if (val.length != String) {
                          return 'Harus Angka';
                        }
                        return null;
                      },
                    ),

                    formInput(
                      marginTop: 0,
                      marginButton: 20,
                      textValue: 'Password',
                      obscureText: true,
                      checkValidator: (val) {
                        if (val == null) {
                          return 'Tidak Boleh Kosong';
                        }
                        if (val.length < 3) {
                          return 'Minimal 3 karakter';
                        }
                        return null;
                      },
                    ),

                    formInput(
                      marginTop: 0,
                      marginButton: 0,
                      textValue: 'Masukkan Ulang Password',
                      obscureText: true,
                      checkValidator: (val) {
                        if (val == null) {
                          return 'Tidak Boleh Kosong';
                        }
                        if (val.length < 3) {
                          return 'Minimal 3 karakter';
                        }
                        return null;
                      },
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
                    if (formkey.currentState != null) {
                      if (formkey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Berhasil Sign Up')));
                        Future.delayed(Duration(seconds: 1), () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) {
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
        )
      ),
      
      
    );
  }
  
}
