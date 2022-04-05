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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'GOOD MORNING, BAGAS',
              style: TextStyle(
                color: mGraywhite,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              'I hope you enjoy this day',
              style: TextStyle(
                color: mGraywhite,
                fontWeight: FontWeight.w300,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 30,), 

            Stack(
              children: [
                Container(
                  height: 630,
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                    // color: mRed,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)
                    ),
                  ),
                  child: Image.asset(
                    'assets/city.png',
                    width: 330,
                  ),
                ),

                Positioned(
                  top: 35,
                  child: Column(
                    children: [
                      Container(
                        height: 600,
                        width: 393,
                        decoration: BoxDecoration(
                          color: mGraywhite,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                
                Positioned(
                  left: 25,
                  top: 80,
                  child: Container(
                    height: 50,
                    width: 340,
                    decoration: BoxDecoration(
                      color: Colors.purple
                    ),

                    child: Row(
                      children: [
                        Container(
                          height: 30,
                          width: 100,
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: Colors.yellow
                          ),
                        )
                      ],
                    ),
                  )
                ),

                Positioned(
                  left: 25,
                  top: 150,
                  child: Column(
                    children: [
                      Container(
                        height: 90,
                        width: 340,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)
                        ), 
                          child: Row(
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                margin: EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                  color: mGray,
                                  borderRadius: BorderRadius.circular(4)
                                ),
                                child: Image.asset('assets/Semen.png'),
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
                                        'Semen Tiga Roda',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                        
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text(
                                        'Stock 10',
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
                                        '150.00',
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
                                  // mainAxisAlignment: MainAxisAlignment.end,
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
                                        color: mGreen,
                                        borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Text(
                                        'Add +',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ), 
                      )
                    ],
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: mBlue,
        unselectedItemColor: mGray,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            label: 'Home',
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            label: 'Home',
          ),
        ] 
      ),
    );
  }
}