import 'package:flutter/material.dart';
import 'package:project/screen/home.dart';
import 'package:project/screen/history.dart';
// import 'package:project/settings.dart';

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int pageIndex = 1;

  final pages = [
    const HomeScreen(),
    const HistoryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BotNavIcon(0, Icons.home, 'Home'),
            BotNavIcon(1, Icons.history, 'History'),
            // BotNavIcon('2', Icons.favorite, 'Favorite'),
            // BotNavIcon('3', Icons.person, 'Profile'),
          ],
        ),
      ),
    );
  }

  IconButton BotNavIcon(
    index,
    IconData icon,
    text,
  ) {
    return IconButton(
      enableFeedback: false,
      onPressed: () {
        setState(() {
          pageIndex = index;
        });
      },
      icon: Icon(icon),
    );
  }
}
