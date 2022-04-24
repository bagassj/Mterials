import 'package:flutter/material.dart';
import 'package:project/screen/home.dart';
import 'package:project/screen/history.dart';
import 'package:project/screen/favorite.dart';
import 'package:project/screen/profile.dart';
import 'package:project/settings.dart';

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int pageIndex = 0;

  final pages = [
    const HomeScreen(),
    const HistoryScreen(),
    const FavoriteScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageIndex == 0 ? mBlue : mGraywhite,
      body: Container(
        width: double.infinity,
        child: pages[pageIndex],
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: mGraywhite,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            pageIndex == 0
                ? BotNavIcon(0, Icons.home, 'Home', mBlue)
                : BotNavIcon(0, Icons.home, 'Home', mGray),
            pageIndex == 1
                ? BotNavIcon(1, Icons.history, 'History', mBlue)
                : BotNavIcon(1, Icons.history, 'History', mGray),
            pageIndex == 2
                ? BotNavIcon(2, Icons.favorite, 'Favorite', mBlue)
                : BotNavIcon(2, Icons.favorite, 'Favorite', mGray),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person,
                    color: mGray,
                  ),
                  Text(
                    'Profile',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 12,
                      color: mGray,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector BotNavIcon(
    index,
    IconData icon,
    text,
    color,
  ) {
    return GestureDetector(
      onTap: () {
        setState(() {
          pageIndex = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: color,
          ),
          Text(
            text,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 12,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
