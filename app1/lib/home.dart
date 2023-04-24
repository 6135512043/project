import 'package:app1/welcome.dart';
import 'package:app1/login.dart';
import 'package:app1/route.dart';
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

Widget logoutbutton(){
  return SizedBox(
    width: 150,
    height: 80,
  child: ElevatedButton
          (onPressed: (){
            auth.signOut().then((value) {
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (context) => HomePageWidget(),
                
                );
                Navigator.pushAndRemoveUntil(context, route, (route) => false);
              });
          }, 
          child: Text("Thank You",style: TextStyle(color: Colors.white,fontSize: 20, ),)),
  );
}

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Logout"),
      backgroundColor: Color.fromARGB(255, 160, 58, 190),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children:<Widget> [
              SizedBox(
                width: 150,
                height: 100,
              ),
              Image.network("https://cdn3.iconfinder.com/data/icons/developerkit/png/Zoom%20Out.png",
              width: 200,
              height: 150,
              ),
              SizedBox(
                width: 150,
                height: 80,
                 ),
                 logoutbutton(),
                 ], 
                 ), 
        ),
        ),
      ),
    );
  }
}
// widget button(){
//   ElevatedButton
//           (onPressed: (){
//             auth.signOut().then((value) {
//                 MaterialPageRoute route = MaterialPageRoute(
//                   builder: (context) => HomePageWidget(),
                
//                 );
//                 Navigator.pushAndRemoveUntil(context, route, (route) => false);
//               });
//           }, 
//           child: Text("back to main page")),
// }
          
        
  