import 'package:flutter/material.dart';
import 'package:project/screen/sign_in.dart';
import 'package:project/screen/main.dart';
import 'package:project/settings.dart';

class deleteDialog extends StatefulWidget {
  @override
  State<deleteDialog> createState() => _deleteDialogState();
}

class _deleteDialogState extends State<deleteDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.highlight_off,
                color: Colors.black54,
                size: 72,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Delete Account?',
                textAlign: TextAlign.center,
                style: TextStyle(color: mGray, fontSize: 14),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInScreen()));
                    },
                    child: Container(
                      width: 100,
                      height: 30,
                      margin: EdgeInsets.only(top: 30),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: mGreen,
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        'Yes',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => mainApp()));
                    },
                    child: Container(
                      width: 100,
                      height: 30,
                      margin: EdgeInsets.only(top: 30),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: mGray, borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        'No',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
