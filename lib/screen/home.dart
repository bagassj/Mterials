import 'package:flutter/material.dart';
import 'package:project/settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mBlue,
      body: Container(
        // padding: kDefaultPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 10,
              child: ElevatedButton(
                onPressed: () {}, 
                child: Text("test"),),
            ),
            Container(
              height: 10,
              child: ElevatedButton(
                onPressed: () {}, 
                child: Text("test"),),
            ),

            // Text(
            //   'GOOD MORNING, BAGAS',
            //   style: TextStyle(
            //     color: mGraywhite,
            //     fontWeight: FontWeight.bold,
            //     fontSize: 18,
            //   ),
            // ),
            // Text(
            //   'I hope you enjoy this day',
            //   style: TextStyle(
            //     color: mGraywhite,
            //     fontWeight: FontWeight.w300,
            //     fontSize: 14,
            //   ),
            // ),
            // SizedBox(height: 100,),
            // Container(
            //   height: 650,
            //   decoration: BoxDecoration(
            //     color: mGraywhite,
            //     borderRadius: BorderRadius.only(
            //       topLeft: Radius.circular(50),
            //       topRight: Radius.circular(50)
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}