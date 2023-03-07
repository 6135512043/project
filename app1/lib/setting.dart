import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:app1/home.dart';
import 'package:app1/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app1/Welcome2.dart';


class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}
class data{
  var name = "";
  var address = "";
  var phone = "";
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
        backgroundColor: Color.fromARGB(255, 160, 58, 190,),),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[SizedBox(
              width: 30.0,height:30.0,
            ),
           // groupImage(),
            nameForm(),SizedBox(
              width: 30.0,height: 20.0,
            ),
            addressForm(),SizedBox(
              width: 30.0,height: 20.0,
            ),
            phoneForm(),SizedBox(
              width: 30.0,height: 40.0,
            ),
            showMap(),SizedBox(
              width: 20.0,height: 10.0,
            ),
            saveButton(),
          ],
          ),
        ),
    );
  }

  Widget saveButton() {
    return Container(
      width: MediaQuery.of(context).size.width,height: 45.0,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 89, 24, 81),
        ),
              onPressed: (){
                Navigator.pushNamed(context, '/welcome');
                }, 
              icon: Icon(Icons.save,color: Color.fromARGB(255, 255, 255, 255) ,),
              label: Text('Save',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255) ),), 
      ),       
    );
  }

  Container showMap() {
    LatLng latLng = LatLng(7.865430, 98.389614);
    CameraPosition cameraPosition = CameraPosition(
      target: latLng,
      zoom: 16.0,
    );
    return Container(
          height: 300.0,
          child: GoogleMap(
            initialCameraPosition: cameraPosition,
            mapType: MapType.normal,
            onMapCreated: (controller){},
           ),
      );
  }

 // Row groupImage() {
   // return Row(
     //     children: <Widget>[
       //   Container(
         //   width: 250.0,
            //child: Image.asset('images/myimge.png'),
           // ),
          //],
       // );
  //}

  Widget nameForm() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(width: 250.0,
        child: TextField(
          decoration: InputDecoration(
            labelText: 'Name User',
            prefixIcon: Icon(Icons.account_box),
            border: OutlineInputBorder(),
            ),
          ),
        ),
    ],
  );

  Widget addressForm() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(width: 250.0,
        child: TextField(
          decoration: InputDecoration(
            labelText: 'Address User',
            prefixIcon: Icon(Icons.home),
            border: OutlineInputBorder(),
            ),
          ),
        ),
    ],
  );

  Widget phoneForm() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(width: 250.0,
        child: TextField(keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            labelText: 'Phone User',
            prefixIcon: Icon(Icons.phone),
            border: OutlineInputBorder(),
            ),
          ),
        ),
    ],
  );
}