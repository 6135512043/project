import 'package:app1/database_sevice.dart';
import 'package:app1/datauser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:app1/home.dart';
import 'package:app1/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app1/Welcome2.dart';
import 'package:app1/route.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final formKey = GlobalKey<FormState>();
  datauser mydata = datauser();

//เตรียม firebase
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  CollectionReference _datauserController = FirebaseFirestore.instance.collection("datauser");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
        backgroundColor: Color.fromARGB(
          255,
          160,
          58,
          190,
        ),
      ),
      body: Container(
        child:Form(
          key:formKey,
          child:SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            SizedBox(
              width: 15.0,
              height: 15.0,
            ),
            // nameForm(),
            Text("Name",style: TextStyle(fontSize: 15),),
            TextFormField(
              validator: RequiredValidator(errorText: "Please enter name"),
              onSaved: (String? name){
                mydata.name=name;
              },
            ),
              SizedBox(
                height: 15,
                ),
            Text("Email",style: TextStyle(fontSize: 15),),
            TextFormField(
              validator: RequiredValidator(errorText: "Please enter email"),
              onSaved: (String? email){
              mydata.email=email;
              },
              keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 15,
                ),
            Text("Address",style: TextStyle(fontSize: 15),),
            TextFormField(
              validator: RequiredValidator(errorText: "Please enter address"),
              onSaved: (String? address){
              mydata.address=address;
              },
              ),
              SizedBox(
                height: 15,
                ),
              Text("Phone",style: TextStyle(fontSize: 15),),
            TextFormField(
              validator: RequiredValidator(errorText: "Please enter phone"),
              onSaved: (String? phone){
              mydata.phone=phone;
              },
              keyboardType: TextInputType.phone,
              ),
              SizedBox(
                height: 15,
                ),
              showMap(),
              saveButton(),
          ],
        ),
      ),
    ),
    ),
  );
}
              // onSaved: (String fname) {
              //   mydata.fname = fname;
              // },
              // keyboardType: TextInputType.name,
              // decoration: InputDecoration(
              //     prefixIcon: Icon(Icons.person),
              //     hintText: "name",
              //     labelText: "Name"),
          //   ),
          //   SizedBox(
          //     width: 30.0,
          //     height: 20.0,
          //   ),
          //   addressForm(),
          //   SizedBox(
          //     width: 30.0,
          //     height: 20.0,
          //   ),
          //   phoneForm(),
          //   SizedBox(
          //     width: 30.0,
          //     height: 40.0,
          //   ),
          //   showMap(),
          //   SizedBox(
          //     width: 20.0,
          //     height: 10.0,
          //   ),
          //   saveButton(),
          // ],
          
        
      
  // Widget showdata() {
  //   return Container(
  //     width: MediaQuery.of(context).size.width,
  //     height: 45.0,
  //     child: ElevatedButton(
  //       style: ElevatedButton.styleFrom(
  //         backgroundColor: Color.fromARGB(255, 89, 24, 81),
  //       ),
  //       onPressed: () {
  //           Navigator.pushNamed(context, '/Welcome2');
  //         }, child: null,
  //       ),
  //     );
  //     }

  Widget saveButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 45.0,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 89, 24, 81),
        ),
        onPressed: () async{
          if (formKey.currentState!.validate())
            formKey.currentState?.save();
            await _datauserController.add({
              "name":mydata.name,
              "email":mydata.email,
              "address":mydata.address,
              "phone":mydata.phone
            });
            Navigator.pushNamed(context, '/Welcome2');
          },
          // await DBService.adddatauser(
          //     datauser(name: 'aa', address: 'aas', phone: '121'));
        icon: Icon(
          Icons.save,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        label: Text(
          'Save',
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
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
      height: 280.0,
      child: GoogleMap(
        initialCameraPosition: cameraPosition,
        mapType: MapType.normal,
        onMapCreated: (controller) {},
      ),
    );
  }
}


  // Widget nameForm() => Row(
  //   mainAxisAlignment: MainAxisAlignment.center,
  //   children: [
  //     Container(width: 250.0,
  //       child: TextField(
  //         decoration: InputDecoration(
  //           labelText: 'Name User',
  //           prefixIcon: Icon(Icons.account_box),
  //           border: OutlineInputBorder(),
  //           ),
  //         ),
  //       ),
  //   ],
  // );

//   Widget addressForm() => Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             width: 250.0,
//             child: TextField(
//               decoration: InputDecoration(
//                 labelText: 'Address User',
//                 prefixIcon: Icon(Icons.home),
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),
//         ],
//       );

//   Widget phoneForm() => Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             width: 250.0,
//             child: TextField(
//               keyboardType: TextInputType.phone,
//               decoration: InputDecoration(
//                 labelText: 'Phone User',
//                 prefixIcon: Icon(Icons.phone),
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),
//         ],
//       );
// }
