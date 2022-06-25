import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/authServices.dart';
import 'package:project/dataClass.dart';
import 'package:project/dbServices.dart';
import 'package:project/screen/editprofile.dart';
import 'package:project/screen/address.dart';
import 'package:project/settings.dart';
import 'package:project/dialog/deleteDialog.dart';
import 'package:project/screen/sign_in.dart';

class ProfileScreen extends StatefulWidget {
  
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
  
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String _imageUser;
  User id = FirebaseAuth.instance.currentUser!;
  late String uID = id.uid;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      backgroundColor: mBlue,
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: double.infinity,
                      width: 75,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 72,
                            height: 72,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: mGray
                            ),
                            child: StreamBuilder<List<Images>>(
                              stream: database.readDataPic(),
                              builder: (context, snapshot) {
                                if (snapshot.hasError) {
                                  return Text("Ada Kesalahan! ${snapshot.hasError}");
                                } else if (snapshot.hasData) {
                                
                                  final datas = snapshot.data!;

                                  return Column(
                                    children: datas.map(buildImage).toList(),
                                  );
                                } else {
                                  return Center(child: CircularProgressIndicator(),);
                                }
                              },
                            ),
                          ),
                        ],
                      )
                    ),
                    SizedBox(width: 20),
                    Container(
                      width: 180,
                      height: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          StreamBuilder<List<Users>>(
                          stream: database.readData(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Text("Ada Kesalahan! ${snapshot.hasError}");
                            } else if (snapshot.hasData) {

                              final datas = snapshot.data!;

                              return Column(
                                children: datas.map(buildData).toList(),
                              );
                            } else {
                              return Center(child: CircularProgressIndicator(),);
                            }
                          },
                        )
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfileScreen(),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: mGraywhite,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Address(),
                            ),
                          );
                        },
                        child: Menu('Address Setting'),
                      ),
                      Menu('History'),
                      Menu('Change Language'),
                      Menu('About'),
                      GestureDetector(
                        onTap: () => showDialog(
                            context: context,
                            builder: (ctxt) => new deleteDialog()),
                        child: Menu('Delete Account'),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: mGraywhite),
                  child: GestureDetector(
                    onTap: () {
                      AuthServices authServices = AuthServices();
                      authServices.logOut(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.logout,
                          size: 18,
                          color: mGray,
                        ),
                        Text(
                          'Logout',
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
  
  Widget buildImage(Images data) => Container(
    width: 72,
    height: 72,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: NetworkImage(data.imageUrl),
        fit: BoxFit.cover
      )
    ),
  );
  
  Widget buildData(Users data) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          data.name,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          data.nope,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          data.mail,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ),
    ],
  );

  Container Menu(text) {
    text;
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 10, bottom: 10),
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: mGray,
            width: 1,
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w700,
          color: Color.fromRGBO(0, 0, 0, 0.4),
          fontSize: 12,
        ),
      ),
    );
  }
}
