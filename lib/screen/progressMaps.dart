import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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

  static const _initialCameraPosition = CameraPosition(
    target: LatLng(37.773972, -122.431297),
    zoom: 11.5,
  );

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () => show(context));
    return Scaffold(
      backgroundColor: mBlue,
      body: GoogleMap(
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        initialCameraPosition: _initialCameraPosition,
      ),
    );
  }
}
