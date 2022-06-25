import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:project/dataClass.dart';

CollectionReference tbItems = FirebaseFirestore.instance.collection('items');
CollectionReference tbHistory = FirebaseFirestore.instance.collection('history');
CollectionReference tbFav = FirebaseFirestore.instance.collection('favorites');
CollectionReference tbUsers = FirebaseFirestore.instance.collection('users');

User id = FirebaseAuth.instance.currentUser!;
late String uID = id.uid;


class database{
  static Stream<List<Users>> readData() => FirebaseFirestore.instance.collection('users').where('mail', isEqualTo: FirebaseAuth.instance.currentUser!.email!)
    .snapshots().map((snapshots)=> 
    snapshots.docs.map((doc) => Users.fromJson(doc.data())).toList());
  
  static Stream<List<Images>> readDataPic() => FirebaseFirestore.instance.collection('profileUsers').where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
    .snapshots().map((snapshots)=> 
    snapshots.docs.map((doc) => Images.fromJson(doc.data())).toList());

  static Stream<QuerySnapshot> getData(){
    return tbItems.snapshots();
  }

  static Stream<QuerySnapshot> getDataHistory(){
    return tbHistory.snapshots();
  }

  static Stream<QuerySnapshot> getDataFav(){
    return tbFav.snapshots();
  }

  static Future<void> addData({required Users users}) async {
    DocumentReference docRef = tbUsers.doc();

    await docRef
    .set(users.toJson())
    .whenComplete(() => print("Add SUkses"))
    .catchError((e) => print(e));
  }

  static Future<void> editData({required Users users}) async {
    DocumentReference docRef = tbUsers.doc(users.name);

    await docRef
    .update(users.toJson())
    .whenComplete(() => print('Edit Sukses'))
    .catchError((e) => print(e));
  }
}
