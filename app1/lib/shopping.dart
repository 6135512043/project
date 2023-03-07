import 'package:app1/home.dart';
import 'package:app1/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Data {
var product = "";
}

class Shopping extends StatefulWidget {
  const Shopping({Key? key}) : super(key: key);

  @override
  _ShoppingState createState() => _ShoppingState();
}
class _ShoppingState extends State<Shopping> {
  @override

  final Data _Data = new Data();
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SHOPPING'),
        backgroundColor: Color.fromARGB(255, 160, 58, 190,),),
      body: SafeArea(
        child:Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children:<Widget> [
              SizedBox(
                height: 15,
                width: 100,
              ),
              search(),
              SizedBox(
                height: 20,
                width: 100,
              ),
              camerabutton(),
              SizedBox(
                height: 5,
                width: 100,
              ),
              product1(),
            ],
          ),
        ),
      ),
    );      
  }

      Widget search(){
      return Form(
      key: _formKey,
      child:Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: 
      <Widget>[SizedBox ( 
        width:300 , 
        height: 50, 
        child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        validator: (var inValue) {
        if (inValue!.length == 0) {
        return "Please enter name of product";
        }
        return null;
        },
        onSaved: (var inValue) {
        this._Data.product = inValue!;
        },
        decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(),
        hintText: "name of product",
        labelText: "name of product"),
        ),
      ),
    ],
    ),
  );
}
  Widget camerabutton(){
    return SizedBox(
      height: 130,
      width: 450,
    child: ElevatedButton(
    child: Row(
    children:[
      Image.asset("images/s1.png",
      width: 120,
      height: 120,
      ),
      Text('    pink crop shirt',style: TextStyle(fontSize: 25),),
    ],
    ),
    onPressed: (){
      Navigator.pushNamed(context, '/item');
      },
      style: ElevatedButton.styleFrom(primary: Color.fromARGB(195, 227, 227, 227),onPrimary: Color.fromARGB(255, 0, 0, 0)),
    ),
  );
}

Widget product1(){
    return SizedBox(
      height: 130,
      width: 450,
    child: ElevatedButton(
    child: Row(
    children:[
      Image.asset("images/s2.png",
      width: 120,
      height: 120,
      ),
      Text('    barbie crop shirt',style: TextStyle(fontSize: 25),),
    ],
    ),
    onPressed: (){
      Navigator.pushNamed(context, '/item');
      },
      style: ElevatedButton.styleFrom(primary: Color.fromARGB(195, 227, 227, 227),onPrimary: Color.fromARGB(255, 0, 0, 0)),
    ),
  );
}
}
  //   Widget product1(){
  //   return SizedBox(
  //     height: 130,
  //     width: 450,
  //   child: RaisedButton(textColor: Colors.white10,
  //   //children: <Widget>[Image.asset("images/s1.jpg"),],
  //   child: Text('shirt',style: TextStyle(fontSize: 20),),
  //   onPressed: (){
  //     Navigator.pushNamed(context, '');
  //   },
  //   ),
  //   );
  // }

