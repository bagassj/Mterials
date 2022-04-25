import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project/settings.dart';
import 'package:project/dialog/messagesDialog.dart';

class progress extends StatefulWidget {
  @override
  State<progress> createState() => _progressState();
}

class _progressState extends State<progress> {
  void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctxt) => new messagesDialog(
        icon: Icons.hourglass_bottom,
        text: 'Menunggu Konfirmasi Pesanan',
        isMessage: true,
        isFinal: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () => show(context));
    return Scaffold(
      backgroundColor: mBlue,
      body: Center(
        child: Text(
          'Maps Page Coming Soon',
          style: TextStyle(color: mGraywhite),
        ),
      ),
    );
  }
}
