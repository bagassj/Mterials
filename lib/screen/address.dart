import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/dataClass.dart';
import 'package:project/dbServices.dart';
import 'package:project/screen/profile.dart';
import 'package:project/settings.dart';

class Address extends StatefulWidget {
  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  late GoogleMapController googleMapController;
  Location location = new Location();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Geoflutterfire geo = Geoflutterfire();


  static const _initialCameraPosition = CameraPosition(
    target: LatLng(37.773972, -122.431297),
    zoom: 11.5,
  );

  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mBlue,
       appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Container(
          child: Text(
            'Settings Location',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: TextButton(
              onPressed: (){
                showDialog(
                  context: context, 
                  builder: (ctxt){
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white, borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.question_mark,
                                color: Colors.black54,
                                size: 72,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                'Save your location?',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: mGray, fontSize: 14),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      _addGeoPoint();
                                      Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => ProfileScreen()));
                                    },
                                    child: Container(
                                      width: 100,
                                      height: 30,
                                      margin: EdgeInsets.only(top: 30),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: mGreen,
                                          borderRadius: BorderRadius.circular(5)),
                                      child: Text(
                                        'Yes',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => Address()));
                                    },
                                    child: Container(
                                      width: 100,
                                      height: 30,
                                      margin: EdgeInsets.only(top: 30),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: mGray, borderRadius: BorderRadius.circular(5)),
                                      child: Text(
                                        'No',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                );
              }, 
              child: Image.asset('assets/save.png')),
          )
        ],
      ),
      body: GoogleMap(
        zoomControlsEnabled: false,
        myLocationButtonEnabled: false,
        initialCameraPosition: _initialCameraPosition,
        markers: markers,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller){
          googleMapController = controller;
        },
      ),
        
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.white,
        onPressed: () async{
          Position position = await _determinePosition();

          googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(target: LatLng(
                position.latitude, 
                position.longitude
              ), 
              zoom: 18
              )
            )
          );
          markers.clear();

          markers.add(Marker(markerId: const MarkerId('currentLocation'),
          position: LatLng(
            position.latitude, 
            position.longitude
          )));

          setState(() {});
        }, 
        label: Icon(
          Icons.location_on,
          color: mBlue,
        )
      ),

      
      
    );
  }

  Future<DocumentReference> _addGeoPoint() async {
    Position position = await _determinePosition();
    GeoFirePoint point = geo.point(latitude: position.latitude, longitude: position.longitude);
    User id = FirebaseAuth.instance.currentUser!;
    late String uID = id.uid;
    
    
    return firestore.collection('locationUsers').add({ 
      'position': point.data,
      'userID': uID

      
    });
    
  }

  Widget buildData(Users data) => Text(
    data.name,
  );
  
  Future<Position>_determinePosition() async{
    bool serviceEnable;
    LocationPermission permission;

    serviceEnable = await Geolocator.isLocationServiceEnabled();

    if(!serviceEnable){
      return Future.error('Location services are disable');
    }

    permission = await Geolocator.checkPermission();

    if(permission ==  LocationPermission.denied){
      permission = await Geolocator.requestPermission();

      if(permission == LocationPermission.denied){
        return Future.error("Location permission denied");
      }
    }

    if(permission ==  LocationPermission.deniedForever){
      return Future.error('Location permission are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();

    return position;
    
  }

}
