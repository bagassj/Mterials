import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({ Key? key }) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  var camera_ready = false;

  late CameraController _camController;
  
  @override

  void initState() {
    super.initState();
    initCamera();
    
  }

  initCamera() async{
    var cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      // print('jumlah kamera: ${cameras.length}');

      CameraDescription camera = cameras.first;

      _camController = CameraController(
        camera,
        ResolutionPreset.high,
      );

      _camController.initialize().then((value) {
        setState(() {
          camera_ready = true;
        });
      });
    }
  }

  @override
  void dispose() {
    _camController.dispose();
    super.dispose();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: _buildKamera(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.black),
                child: Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: FloatingActionButton(
                      onPressed: (){},
                      child: Icon(Icons.camera, color: Colors.black),
                      backgroundColor: Colors.white,
                    ),
                  )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildKamera() {
    if (camera_ready == false) {
      return CircularProgressIndicator();
    }
    if (_camController != null) {
      return CameraPreview(_camController);
    }
    return Container();
  }
}