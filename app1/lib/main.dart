//import 'package:app1/login.dart';
import 'package:app1/login.dart';
import 'package:app1/route.dart';
import 'package:app1/setting.dart';
import 'package:flutter/material.dart';
import 'package:app1/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,

      ),
      routes: routes,
      //home: login()
       home: HomePageWidget()
       //home: Setting()
    );
  }
}
