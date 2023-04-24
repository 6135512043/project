// import 'package:app1/datauser.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// class showdatasetting extends StatefulWidget {
//   const showdatasetting({Key? key}) : super(key: key);

//   @override
//   State<showdatasetting> createState() => _showdatasettingState();
// }

// class _showdatasettingState extends State<showdatasetting> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title:Text("my information")
//       ),
//       body: StreamBuilder(
//         stream:FirebaseFirestore.instance.collection("datauser").snapshots(),
//         builder:(context,AsyncSnapshot<QuerySnapshot> snapshot){
//           if(!snapshot.hasData){
//             return Center(child: CircularProgressIndicator(),);
//           }
//           var result = snapshot.data;
//           return Container(
//             child: ListTile(title: Text("Name"),),
//                    ListTile(title: Text("${datauser.name}"),),
//             ),
//             }
//           ),
//           ),
//         },
//   }