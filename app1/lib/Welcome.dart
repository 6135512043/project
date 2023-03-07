import 'package:app1/home.dart';
import 'package:app1/login.dart';
import 'package:app1/relogin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app1/register.dart';
import 'package:app1/setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/widgets.dart';
import 'package:app1/shopping.dart';


class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  get height => null;

    Widget ShoppingButton(){
      return SizedBox(
        width: 170.0,
        height: 100.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 139, 53, 201),
          ),
          child: Text('Product',style: TextStyle(color: Colors.white,fontSize: 20),),
          onPressed: (){
            Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Shopping(),
          ));
          },
        ),
      );
    }

Widget LoginButton(){
  return SizedBox(
        width: 170.0,
        height: 100.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 16, 48, 152),
          ),
          child: Text('Loin',style: TextStyle(color: Colors.white,fontSize: 20),),
          onPressed: (){
            Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => login(),
          ));
          },
        ),
      );
}


    Widget SettingButton(){
      return SizedBox(
        width: 170.0,
        height: 100.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 139, 53, 201),
          ),
          child: Text('Setting',style: TextStyle(color: Colors.white,fontSize: 20),),
          onPressed: (){
            Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Relogin(),
          ));
          },
        ),
      );
    }

    Widget LogoutButton(){
      return SizedBox(
        width: 170.0,
        height: 100.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 139, 53, 201),
          ),
          child: Text('Logout',style: TextStyle(color: Colors.white,fontSize: 20),),
          onPressed: (){
            Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Relogin(),
          ));
          },
        ),
      );
}

 Widget showButton(){
  return Row(mainAxisSize:MainAxisSize.min ,
    children: <Widget>[
      ShoppingButton(),
      SizedBox(
        width: 30.0,
        height: 30.0,
      ),
    LoginButton()],
    );
 }

Widget showButton1(){
  return Row(mainAxisSize:MainAxisSize.min ,
    children: <Widget>[
      SettingButton(),
      SizedBox(
        width: 30.0,
        height: 30.0,
      ),
    LogoutButton()],
    );
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"),
      backgroundColor: Color.fromARGB(255, 160, 58, 190,),),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Image.network(
               "https://cdn-icons-png.flaticon.com/512/4213/4213147.png",
                height: 200,
               width: 150,
               ),
               SizedBox(
                height: 40.0,
               ),
              showButton(),
              SizedBox(
                height: 20.0,),
              showButton1(),
            ],
            ),
            ),
          ),
    );
  }
  }