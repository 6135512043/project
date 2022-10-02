import 'package:app1/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app1/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/widgets.dart';


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
        child: RaisedButton(color: Colors.purple.shade700,
          child: Text('Shopping',style: TextStyle(color: Colors.white),),
          onPressed: (){
          },
          
        ),
      );
    }

Widget LoginButton(){
  return SizedBox(
    child: OutlineButton(color: Colors.yellow.shade300,
      child: Text('Login',style: TextStyle(color: Colors.black),),
      onPressed:(){
        Navigator.pushNamed(context, '/login');
      },
    ),
  );
}


    Widget SettingButton(){
      return SizedBox(
        child: RaisedButton(color: Colors.green.shade700,
          child: Text('Setting',style: TextStyle(color: Colors.white),),
          onPressed: (){},
        ),
      );
    }

    Widget LogoutButton(){
      return SizedBox(
        child: OutlineButton(color: Color.fromARGB(255, 42, 185, 162),
        child: Text('Logout',style: TextStyle(color: Colors.black),),
        onPressed:(){
        Navigator.pushNamed(context, '/home');
      },
    ),
  );
}

 Widget showButton(){
  return Row(mainAxisSize:MainAxisSize.min ,
    children: <Widget>[
      ShoppingButton(),
      SizedBox(
        width: 50.0,
        height: 50.0,
      ),
    LoginButton()],
    );
 }

Widget showButton1(){
  return Row(mainAxisSize:MainAxisSize.min ,
    children: <Widget>[
      SettingButton(),
      SizedBox(
        width: 50.0,
        height: 50.0,
      ),
    LogoutButton()],
    );
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"),
      backgroundColor: Colors.red.shade300,),
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
              showButton(),
              SizedBox(
                height: 30.0,),
              showButton1(),
            ],
            ),
            ),
          ),
    );
  }
  }