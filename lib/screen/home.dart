import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:project/dataClass.dart';
import 'package:project/dbServices.dart';
import 'package:project/settings.dart';
import 'package:project/dialog/buyDialog.dart';
import 'package:project/dialog/cartDialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              color: mBlue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'GOOD MORNING, ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18),
                      ),
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
                  Text(
                    'I hope you enjoy the day',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontSize: 14),
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: mGraywhite,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
              ),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 180,
                          height: 60,
                          margin: EdgeInsets.only(
                            top: 30,
                            bottom: 10,
                          ),
                          child: DropdownSearch<String>(
                            items: ["All", "Semen", "Cat", "Kayu", 'Paku'],
                            mode: Mode.MENU,
                            onChanged: print,
                            selectedItem: "All",
                            dropdownSearchDecoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(3),
                                    borderSide: BorderSide.none)),
                          ),
                        ),
                        GestureDetector(
                          onTap: (() {
                            showDialog(
                              context: context,
                              builder: (ctxt) => new cartDialog(),
                            );
                          }),
                          child: Container(
                            width: 28,
                            height: 28,
                            margin:
                                EdgeInsets.only(top: 30, bottom: 10, left: 100),
                            child: Icon(
                              Icons.shopping_cart,
                              size: 28,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                        stream: database.getData(),
                        builder: (context, snapshot){
                          if (snapshot.hasError){
                            print('error');
                          }
                          else if(snapshot.hasData || snapshot.data != null){
                            return ListView.separated(
                              itemBuilder: (context, index) {
                                DocumentSnapshot dsData = snapshot.data!.docs[index];
                                String nama = dsData['name'];
                                String foto = dsData['img'];
                                String harga = dsData['price'];
                                String tersedia = dsData['stock'];

                                return Center(
                                  child: BoxCard(
                                    foto,
                                    nama,
                                    tersedia,
                                    harga
                                  )
                                );
                              },
                              separatorBuilder: (context, index) => SizedBox(height: 1,), 
                              itemCount: snapshot.data!.docs.length
                            );
                          }
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                    ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget buildData(Users data) => Text(
    data.name,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontSize: 18),
  );

  Container BoxCard(image, name, stock, price) {
    return Container(
      height: 90,
      width: 340,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Container(
            height: 70,
            width: 70,
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                color: mGray, borderRadius: BorderRadius.circular(4)),
            child: Image.network(image),
          ),
          Container(
            height: 70,
            width: 170,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Text(
                    stock,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                      color: Color.fromARGB(255, 180, 180, 180),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5, top: 5),
                  child: Text(
                    price,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (() {
              showDialog(
                context: context,
                builder: (ctxt) => new buyDialog(),
              );
            }),
            child: Container(
              height: 70,
              width: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    height: 30,
                    width: 30,
                    child: Icon(
                      Icons.favorite,
                      color: mGray,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 25,
                    width: 80,
                    decoration: BoxDecoration(
                        color: mGreen, borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      'Add +',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
