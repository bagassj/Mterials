import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              Container(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'GOOD MORNING, BAGAS',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18
                      ),
                    ),

                    Text(
                      'I hope you enjoy the day',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontSize: 14
                      ),
                    )
                  ],
                ),
              ),

              Container(
                height: 600,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: mGraywhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)
                  ),
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
                          margin: EdgeInsets.only(top: 30, bottom: 10, ),
                              child: DropdownSearch<String>(
                              items: ["All","Semen", "Cat", "Kayu", 'Paku'],
                              mode: Mode.MENU,                        
                              onChanged: print,
                              selectedItem: "All",
                              dropdownSearchDecoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(3), borderSide: BorderSide.none)
                              ),
                          ),
                        ),

                        Container(
                          width: 60,
                          height: 60,
                          margin: EdgeInsets.only(top: 30, bottom: 10, left: 100),
                            child: Icon(
                            Icons.shopping_cart,
                            size: 40,
                          ),
                        ),
                      ],  
                      ),
                    ),


                    Wrap(
                      alignment: WrapAlignment.center,
                      children: [              
                        BoxCard('assets/Semen.png','Semen Tiga Roda','Stock 10','150.000',),
                        BoxCard('assets/Holcim.png','Semen Holcim','Stock 5','120.000',),
                        BoxCard('assets/Gresik.png','Semen Gresik','Stock 15','145.000',),
                        BoxCard('assets/Padang.png','Semen Padang','Stock 0','115.000',),
                        // BagasCard(),
                      ],
                    ),
                  ],
                ),
                
                
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: mBlue,
        unselectedItemColor: mGray,
        items: [
          Test(Icons.home, 'Home'),
          Test(Icons.history, 'History'),
          Test(Icons.favorite, 'Favorite'),
          Test(Icons.person, 'Profile'),
        ] 
      ),
    );
  }

  Container BoxCard(image,nama,stock,harga) {
    return Container(
      height: 90,
      width: 340,
      margin: EdgeInsets.all(10),
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
                    margin: EdgeInsets.only(left: 5, top: 5),
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
    );
  }

  BottomNavigationBarItem Test(IconData icon, text,) {
    return BottomNavigationBarItem(
          icon: Icon(icon),
          label: text,
          
        );
  } 

}