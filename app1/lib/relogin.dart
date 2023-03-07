import 'package:app1/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:app1/route.dart';
import 'package:app1/welcome.dart';
import 'package:app1/login.dart';

class Relogin extends StatefulWidget {
  const Relogin({Key? key}) : super(key: key);

  @override
  _ReloginState createState() => _ReloginState();
}

class _ReloginState extends State<Relogin> {

  final scaffoldKey = GlobalKey<ScaffoldState>();

  get height => null;

Widget Buttonmain(){
      return SizedBox(
        width: 150.0,
        height: 100.0,
        child: RaisedButton(color: Color.fromARGB(255, 185, 81, 81),
          child: Text('back',style: TextStyle(color: Colors.white,fontSize: 30),),
          onPressed: (){
            Navigator.pushNamed(context, '/welcome');
          },
        ),
      );
    }

Widget buttonlog(){
      return SizedBox(
        width: 150.0,
        height: 100.0,
        child: RaisedButton(color: Color.fromARGB(255, 69, 178, 63),
          child: Text('login',style: TextStyle(color: Colors.white,fontSize: 30),
          ),
          onPressed: (){
            Navigator.pushNamed(context,'/login');
          },
        ),
      );
    }

Widget button(){
  return Row(mainAxisSize:MainAxisSize.min ,
    children: <Widget>[
      Buttonmain(),
      SizedBox(
        width: 30.0,
        height: 30.0,
      ),
    buttonlog(),
    ],
  );
}

Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Please login'),
        backgroundColor: Color.fromARGB(255, 160, 58, 190,),),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children:<Widget> [
              SizedBox(
                width: 150,
                height: 100,
              ),
              Image.network("https://cdn0.iconfinder.com/data/icons/IS_CMS/256/user_login.png",
              width: 200,
              height: 150,
              ),
              SizedBox(
                width: 150,
                height: 80,
              ),
              button(),
            ],
          ),
        ),
      ),
    );
  }
}


