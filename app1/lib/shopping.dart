import 'package:app1/home.dart';
import 'package:app1/item.dart';
import 'package:app1/models/item_model.dart';
import 'package:app1/welcome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app1/route.dart';
import 'package:url_launcher/url_launcher.dart';

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

  List<Widget> widgets = [];
  List<ItemModel> itemModel = [];

  @override
  void initState() {
    super.initState();
    readData();
  }

  Future<Null> readData() async {
    await Firebase.initializeApp().then((value) async {
      print('initialize Success');
      await FirebaseFirestore.instance
          .collection('item')
          .orderBy('name')
          .snapshots()
          .listen((event) {
        print('snapshot = ${event.docs}');
        int index = 0;
        for (var snapshot in event.docs) {
          Map<String, dynamic> map = snapshot.data();
          print('map = $map');
          ItemModel model = ItemModel.fromMap(map);
          itemModel.add(model);
          print('name = ${model.name}');
          setState(() {
            widgets.add(createWigget(model, index));
          });
          index++;
        }
      });
    });
  }

  Widget createWigget(ItemModel model, int index) => GestureDetector(
        onTap: () {
          print('Click from index = $index');
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Showmodel(
                  itemModel: itemModel[index],
                ),
              ));
        },
        child: Card(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(height: 120, child: Image.network(model.imageitem)),
                SizedBox(
                  height: 5,
                ),
                Text(
                  model.name,
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(222, 0, 0, 0),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ALL SHOPPING'),
        backgroundColor: Color.fromARGB(
          255,
          160,
          58,
          190,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(
                    height: 15,
                    width: 100,
                  ),
                  search(),
                  SizedBox(
                    height: 20,
                    width: 100,
                  ),
                  showscreen(),
                  SizedBox(
                    height: 20,
                    width: 100,
                  ),
                  widgets.length == 0
                      ? Center(child: CircularProgressIndicator())
                      : Container(
                          height: 500,
                          child: GridView.extent(
                            maxCrossAxisExtent: 300,
                            children: widgets,
                          ),
                        ),
                  // shirt1(),
                  // SizedBox(
                  //   height: 5,
                  //   width: 100,
                  // ),
                  // pants1(),
                  // SizedBox(
                  //   height: 5,
                  //   width: 100,
                  // ),
                  // shirt2(),
                  // SizedBox(
                  //   height: 5,
                  //   width: 100,
                  // ),
                  // pants2(),
                  // SizedBox(
                  //   height: 5,
                  //   width: 100,
                  // ),
                  // shirt3(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget search() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 300,
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

  Widget allscreen() {
    return SizedBox(
      height: 55,
      width: 100,
      child: ElevatedButton(
        child: Row(
          children: [
            Text(
              '  All',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/shopping');
        },
        style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(195, 206, 160, 240),
            onPrimary: Color.fromARGB(255, 0, 0, 0)),
      ),
    );
  }

  Widget shirtscreen() {
    return SizedBox(
      height: 55,
      width: 114,
      child: ElevatedButton(
        child: Row(
          children: [
            Image.asset(
              "images/s1.png",
              width: 40,
              height: 40,
            ),
            Text(
              '  Shirt',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/shoppingshirt');
        },
        style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(195, 227, 227, 227),
            onPrimary: Color.fromARGB(255, 0, 0, 0)),
      ),
    );
  }

  Widget pantsscreen() {
    return SizedBox(
      height: 55,
      width: 122,
      child: ElevatedButton(
        child: Row(
          children: [
            Image.asset(
              "images/p1.png",
              width: 40,
              height: 40,
            ),
            Text(
              '  Pants',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/shoppingpants');
        },
        style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(195, 227, 227, 227),
            onPrimary: Color.fromARGB(255, 0, 0, 0)),
      ),
    );
  }

  Widget showscreen() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        allscreen(),
        SizedBox(
          width: 10.0,
          height: 50.0,
        ),
        shirtscreen(),
        SizedBox(
          width: 10.0,
          height: 50.0,
        ),
        pantsscreen(),
      ],
    );
  }

  // Widget shirt1() {
  //   return SizedBox(
  //     height: 130,
  //     width: 450,
  //     child: ElevatedButton(
  //       child: Row(
  //         children: [
  //           Image.network(
  //             "https://firebasestorage.googleapis.com/v0/b/project-90bb1.appspot.com/o/s1.png?alt=media&token=7de8ce67-efe9-466c-bef5-79e551d36167",
  //             width: 120,
  //             height: 120,
  //           ),
  //           Text(
  //             '    pink crop shirt',
  //             style: TextStyle(fontSize: 25),
  //           ),
  //         ],
  //       ),
  //       onPressed: () {
  //         Navigator.pushNamed(context, '/item');
  //       },
  //       style: ElevatedButton.styleFrom(
  //           primary: Color.fromARGB(195, 227, 227, 227),
  //           onPrimary: Color.fromARGB(255, 0, 0, 0)),
  //     ),
  //   );
  // }

  // Widget shirt2() {
  //   return SizedBox(
  //     height: 130,
  //     width: 450,
  //     child: ElevatedButton(
  //       child: Row(
  //         children: [
  //           Image.network(
  //             "https://firebasestorage.googleapis.com/v0/b/project-90bb1.appspot.com/o/s2.png?alt=media&token=b827c690-cce6-43e9-977e-8b37125d30a8",
  //             width: 120,
  //             height: 120,
  //           ),
  //           Text(
  //             '    barbie crop shirt',
  //             style: TextStyle(fontSize: 25),
  //           ),
  //         ],
  //       ),
  //       onPressed: () {
  //         Navigator.pushNamed(context, '/item2');
  //       },
  //       style: ElevatedButton.styleFrom(
  //           primary: Color.fromARGB(195, 227, 227, 227),
  //           onPrimary: Color.fromARGB(255, 0, 0, 0)),
  //     ),
  //   );
  // }

  // Widget shirt3() {
  //   return SizedBox(
  //     height: 130,
  //     width: 450,
  //     child: ElevatedButton(
  //       child: Row(
  //         children: [
  //           Image.network(
  //             "https://firebasestorage.googleapis.com/v0/b/project-90bb1.appspot.com/o/s3.png?alt=media&token=befde63e-3fb6-4bb3-bb33-3b5bcb846696",
  //             width: 120,
  //             height: 120,
  //           ),
  //           Text(
  //             '    red off top',
  //             style: TextStyle(fontSize: 25),
  //           ),
  //         ],
  //       ),
  //       onPressed: () {
  //         Navigator.pushNamed(context, '/item2');
  //       },
  //       style: ElevatedButton.styleFrom(
  //           primary: Color.fromARGB(195, 227, 227, 227),
  //           onPrimary: Color.fromARGB(255, 0, 0, 0)),
  //     ),
  //   );
  // }

  // Widget pants1() {
  //   return SizedBox(
  //     height: 130,
  //     width: 450,
  //     child: ElevatedButton(
  //       child: Row(
  //         children: [
  //           Image.network(
  //             "https://firebasestorage.googleapis.com/v0/b/project-90bb1.appspot.com/o/p1.png?alt=media&token=57535297-3788-4008-8f72-ec5ad2371568",
  //             width: 120,
  //             height: 120,
  //           ),
  //           Text(
  //             '    M short jeans',
  //             style: TextStyle(fontSize: 25),
  //           ),
  //         ],
  //       ),
  //       onPressed: () {
  //         Navigator.pushNamed(context, '/item2');
  //       },
  //       style: ElevatedButton.styleFrom(
  //           primary: Color.fromARGB(195, 227, 227, 227),
  //           onPrimary: Color.fromARGB(255, 0, 0, 0)),
  //     ),
  //   );
  // }

  // Widget pants2() {
  //   return SizedBox(
  //     height: 130,
  //     width: 450,
  //     child: ElevatedButton(
  //       child: Row(
  //         children: [
  //           Image.network(
  //             "https://firebasestorage.googleapis.com/v0/b/project-90bb1.appspot.com/o/p2.png?alt=media&token=be998aeb-3f5a-42c6-9f7c-3a486b910b0a",
  //             width: 120,
  //             height: 120,
  //           ),
  //           Text(
  //             '    faded jeans',
  //             style: TextStyle(fontSize: 25),
  //           ),
  //         ],
  //       ),
  //       onPressed: () {
  //         Navigator.pushNamed(context, '/item2');
  //       },
  //       style: ElevatedButton.styleFrom(
  //           primary: Color.fromARGB(195, 227, 227, 227),
  //           onPrimary: Color.fromARGB(255, 0, 0, 0)),
  //     ),
  //   );
  // }
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

