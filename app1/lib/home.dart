import 'package:app1/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  final auth = FirebaseAuth.instance;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"),
      backgroundColor: Color.fromARGB(255, 160, 58, 190),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: ElevatedButton(onPressed: (){
            auth.signOut().then((value) {
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (context) => login(),
                
                );
                Navigator.pushAndRemoveUntil(context, route, (route) => false);
              });
          }, 
          child: Text("Logout")),
          
          
        ),
      ),
    );
  }
}