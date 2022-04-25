import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
// import 'package:project/screen/home.dart';
import 'package:project/settings.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  // late int index;
  // List showPage = [
  //   HomeScreen()
  // ];

  // @override
  // void initState() {
  //   index = 0;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            height: 90,
            width: 340,
            child: Row(
              children: [
                Container(
                  width: 150,
                  height: 60,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 30),
                  child: Text(
                    'My History',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
                Container(
                  width: 120,
                  height: 60,
                  margin: EdgeInsets.only(top: 30, left: 70, bottom: 10),
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
                          borderSide: BorderSide.none),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Wrap(
            children: [
              BoxCard(
                'assets/Semen.png',
                'Semen Tiga Roda',
                'Stock 10',
                '150.000',
              ),
              BoxCard(
                'assets/Holcim.png',
                'Semen Holcim',
                'Stock 5',
                '120.000',
              ),
              BoxCard(
                'assets/Gresik.png',
                'Semen Gresik',
                'Stock 15',
                '145.000',
              ),
              BoxCard(
                'assets/Padang.png',
                'Semen Padang',
                'Stock 0',
                '115.000',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container BoxCard(image, nama, stock, harga) {
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
            child: Image.asset(image),
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
                    nama,
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
                  margin: EdgeInsets.only(left: 5, top: 15),
                  child: Text(
                    harga,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 70,
            width: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 25,
                  width: 80,
                  child: Text(
                    '12 Juli 2021',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black12,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
