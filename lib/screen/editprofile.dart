import 'package:flutter/material.dart';
import 'package:project/screen/camera.dart';
import 'package:project/settings.dart';

class EditProfileScreen extends StatefulWidget {
  
  const EditProfileScreen({ Key? key }) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
  
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
            'Edit Profile',
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
              onPressed: (){}, 
              child: Image.asset('assets/save.png')),
          )
        ],
      ),


      body: Center(
        child: Column(
          children: [
            Container(
              height: 100,
              width: 350,
              margin: EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CameraScreen(),
                        ),
                      );
                    },

                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color.fromARGB(113, 0, 0, 0),            
                      ),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  

                  Container(
                    width: 230,
                    height: 80,
                    margin: EdgeInsets.only(left: 30),
                    alignment: Alignment.center,
                    child: Text('Pasang foto yang oke! Semua orang bakal bisa lihat.'),
                  )
                ],
              ),
            ),

            Container(
              height: 30,
              width: 350,
              alignment: Alignment.centerLeft,
              child: Text('Edit Profile'),
            ),

            customFieldEdit(
              labelText: 'Nama',
              top: 80,
            ),

            customFieldEdit(
              labelText: 'Nomor HP',
              top: 30,
            ),

            customFieldEdit(
              labelText: 'Email',
              top: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class customFieldEdit extends StatelessWidget{
  final String labelText;
  final double top;

  const customFieldEdit({
    required this.labelText, 
    required this.top,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
              width: 350,
              margin: EdgeInsets.only(top: top),
              child: Column(
               children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Text(
                          labelText,
                          style: TextStyle(
                            color: Color.fromARGB(170, 0, 0, 0)
                          ),
                        ),
                        Text(
                          '*',
                          style: TextStyle(
                            color: Colors.red
                          ),
                        )
                      ],
                    ),
                  ),
                  TextFormField(
                    autofocus: false,
                  )
               ], 
              ),
            );
  }

}