import 'dart:io';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/dataClass.dart';
import 'package:project/dbServices.dart';
import 'package:project/settings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class EditProfileScreen extends StatefulWidget {
  final Users? detData;
  const EditProfileScreen({ Key? key, this.detData }) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
  
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool _load = false;
  late File imgFile;
  final imgPicker = ImagePicker();
  late String url;
  User id = FirebaseAuth.instance.currentUser!;
  late String uID = id.uid;

  Widget showImage(){
    if(imgFile == null){
      return Text('');
    }
    else{
      return Image.file(imgFile,fit: BoxFit.cover);
    }
  }  

  void openCamera() async {
    var imgCamera = await imgPicker.pickImage(source: ImageSource.camera); 
    
    setState(() {
      imgFile = File(imgCamera!.path);
      _load = true;
    });
    Navigator.pop(context);
  }

  void openGallery() async{
    var imgGallery = await imgPicker.pickImage(source: ImageSource.gallery);
    
    setState(() {
      imgFile = File(imgGallery!.path);
      _load = true;
    });
    Navigator.pop(context);
  }

  void addPhoto() async{
    final ref = FirebaseStorage.instance
        .ref()
        .child('usersImages')
        .child( uID+'.jpg');
    await ref.putFile(imgFile);
    url = await ref.getDownloadURL();

    await FirebaseFirestore.instance.collection('profileUsers').doc(uID).set({
        'id': uID,
        'imageUrl': url,
      });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Container(
          child: Text(
            'Edit Profile',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: TextButton(
              onPressed: (){
                addPhoto();
              }, 
              child: Image.asset('assets/save.png')),
          )
        ],
      ),


      body: Padding(
        padding: EdgeInsets.only(left: 15,right: 15),
        child: Center(
          child: Column(
            children: [
              Container(
                height: 100,
                width: 350,
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context, 
                          builder: (BuildContext context){
                            return Container(
                              height: 130.0,
                              color: Colors.white,
                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.all(25),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Column(
                                        children: [
                                          IconButton(
                                            onPressed: (){openCamera();}, 
                                            icon: Icon(
                                              Icons.camera,
                                              size: 35.0,
                                              color: mBlue,
                                            )
                                          ),
                                          Text(
                                            'Camera',
                                            style: subTitle,
                                          )
                                        ],
                                      )
                                    ),
                                    SizedBox(width: 100.0),
                                    Container(
                                      child: Column(
                                        children: [
                                          IconButton(
                                            onPressed: (){openGallery();}, 
                                            icon: Icon(
                                              Icons.image,
                                              size: 35.0,
                                              color: mBlue,
                                            )
                                          ),
                                          Text(
                                            'Gallery',
                                            style: subTitle,
                                          )
                                        ],
                                      )
                                    ),
                                  ],
                                ),
                                ),
                            );
                          }
                        );
                      },


                      child: Container(
                        width: 80,
                        height: 80,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Color.fromARGB(113, 0, 0, 0),      
                        ),

                        child: Container(
                          child: _load? showImage(): Container(),
                        ),
                        // child: Icon(
                        //   Icons.edit,
                        //   color: Colors.white,
                        //   size: 30,
                        // ),
                      ),
                    ),
                    

                    Container(
                      width: 210,
                      height: 80,
                      margin: EdgeInsets.only(left: 30),
                      alignment: Alignment.center,
                      child: Text('Pasang foto yang oke! Semua orang bakal bisa lihat.'),
                    )
                  ],
                ),
              ),

              Container(
                height: 30,
                width: 350,
                alignment: Alignment.centerLeft,
                child: Text('Tambah Foto'),
              ),
              Column(
                children: [
                  Container(
                    width: 350,
                    margin: EdgeInsets.only(top: 80.0),
                    child: Column(
                     children: [
                        Container(
                          width: double.infinity,
                          child: Row(
                            children: [
                              Text(
                                'Name',
                                style: TextStyle(
                                  color: Color.fromARGB(170, 0, 0, 0)
                                ),
                              ),
                              Text(
                                '*',
                                style: TextStyle(
                                  color: Colors.red
                                ),
                              )
                            ],
                          ),
                        ),
                        TextFormField(
                          controller: ctrlName,
                          autofocus: false,
                          decoration: InputDecoration(
                            // hintText: data.name,
                          ),
                        )
                     ], 
                    ),
                  ),

                  Container(
                    width: 350,
                    margin: EdgeInsets.only(top: 30.0),
                    child: Column(
                     children: [
                        Container(
                          width: double.infinity,
                          child: Row(
                            children: [
                              Text(
                                'Nomor HP',
                                style: TextStyle(
                                  color: Color.fromARGB(170, 0, 0, 0)
                                ),
                              ),
                              Text(
                                '*',
                                style: TextStyle(
                                  color: Colors.red
                                ),
                              )
                            ],
                          ),
                        ),
                        TextFormField(
                          controller: ctrlNope,
                          autofocus: false,
                          decoration: InputDecoration(
                            // hintText: data.nope,
                          ),
                        )
                     ], 
                    ),
                  ),

                  Container(
                    width: 350,
                    margin: EdgeInsets.only(top: 30.0),
                    child: Column(
                     children: [
                        Container(
                          width: double.infinity,
                          child: Row(
                            children: [
                              Text(
                                'Email',
                                style: TextStyle(
                                  color: Color.fromARGB(170, 0, 0, 0)
                                ),
                              ),
                              Text(
                                '*',
                                style: TextStyle(
                                  color: Colors.red
                                ),
                              )
                            ],
                          ),
                        ),
                        TextFormField(
                          controller: ctrlMail,
                          autofocus: false,
                          decoration: InputDecoration(
                            // hintText: data.mail,
                          ),
                        )
                     ], 
                    ),
                  ),

                  // customFieldEdit(
                  //   controller: TextEditingController(),
                  //   labelText: "Nomor Hp",
                  //   top: 30,
                  //   hint: data.nope,
                  // ),

                  // customFieldEdit(
                  //   controller: TextEditingController(),
                  //   labelText: "Email",
                  //   top: 30,
                  //   hint: data.mail,
                  // ),
                ],
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}

final ctrlName = TextEditingController();
final ctrlNope = TextEditingController();
final ctrlMail = TextEditingController();

// Future<void> updateData([DocumentSnapshot? documentSnapshot]) async{
//   if(documentSnapshot != null){
//     ctrlName.text =  documentSnapshot['name'];
//     ctrlNope.text =  documentSnapshot['nope'];
//     ctrlMail.text =  documentSnapshot['mail'];
    
//     await 
      
//     );
//   }
// }

// Widget buildData(Users data) => Column(
//   children: [
//     Container(
//       width: 350,
//       margin: EdgeInsets.only(top: 80.0),
//       child: Column(
//        children: [
//           Container(
//             width: double.infinity,
//             child: Row(
//               children: [
//                 Text(
//                   'Name',
//                   style: TextStyle(
//                     color: Color.fromARGB(170, 0, 0, 0)
//                   ),
//                 ),
//                 Text(
//                   '*',
//                   style: TextStyle(
//                     color: Colors.red
//                   ),
//                 )
//               ],
//             ),
//           ),
//           TextFormField(
//             controller: ctrlName,
//             autofocus: false,
//             decoration: InputDecoration(
//               hintText: data.name,
//             ),
//           )
//        ], 
//       ),
//     ),

//     Container(
//       width: 350,
//       margin: EdgeInsets.only(top: 30.0),
//       child: Column(
//        children: [
//           Container(
//             width: double.infinity,
//             child: Row(
//               children: [
//                 Text(
//                   'Nomor HP',
//                   style: TextStyle(
//                     color: Color.fromARGB(170, 0, 0, 0)
//                   ),
//                 ),
//                 Text(
//                   '*',
//                   style: TextStyle(
//                     color: Colors.red
//                   ),
//                 )
//               ],
//             ),
//           ),
//           TextFormField(
//             controller: ctrlNope,
//             autofocus: false,
//             decoration: InputDecoration(
//               hintText: data.nope,
//             ),
//           )
//        ], 
//       ),
//     ),

//     Container(
//       width: 350,
//       margin: EdgeInsets.only(top: 30.0),
//       child: Column(
//        children: [
//           Container(
//             width: double.infinity,
//             child: Row(
//               children: [
//                 Text(
//                   'Email',
//                   style: TextStyle(
//                     color: Color.fromARGB(170, 0, 0, 0)
//                   ),
//                 ),
//                 Text(
//                   '*',
//                   style: TextStyle(
//                     color: Colors.red
//                   ),
//                 )
//               ],
//             ),
//           ),
//           TextFormField(
//             controller: ctrlMail,
//             autofocus: false,
//             decoration: InputDecoration(
//               hintText: data.mail,
//             ),
//           )
//        ], 
//       ),
//     ),

//     // customFieldEdit(
//     //   controller: TextEditingController(),
//     //   labelText: "Nomor Hp",
//     //   top: 30,
//     //   hint: data.nope,
//     // ),

//     // customFieldEdit(
//     //   controller: TextEditingController(),
//     //   labelText: "Email",
//     //   top: 30,
//     //   hint: data.mail,
//     // ),
//   ],
// );

