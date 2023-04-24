import 'package:app1/item.dart';
import 'package:app1/models/item_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Data {
var product = "";
}

class shoppingpants extends StatefulWidget {
  const shoppingpants({Key? key}) : super(key: key);

  @override
  State<shoppingpants> createState() => _shoppingpantsState();
}

class _shoppingpantsState extends State<shoppingpants> {
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
          .where('type', isEqualTo: 'pants')
          // .orderBy('name')
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
          print('Click s from index = $index');
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


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PANTS SHOPPING'),
        backgroundColor: Color.fromARGB(255, 160, 58, 190,),),
      body: SafeArea(
        child:Expanded(
          child: SingleChildScrollView(
            child: Center(
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
                      // pants1(),
                      // SizedBox(
                      //   height: 5,
                      //   width: 100,
                      // ),
                      // pants2(),
                      // SizedBox(
                      //   height: 5,
                      //   width: 100,
                      // ),
                    ],
                  ),
                ),
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

  Widget allscreen(){
    return SizedBox(
      height: 55,
      width: 100,
    child: ElevatedButton(
    child: Row(
    children:[
      Text('  All',style: TextStyle(fontSize: 16),),
    ],
    ),
    onPressed: (){
      Navigator.pushNamed(context, '/shopping');
      },
      style: ElevatedButton.styleFrom(primary: Color.fromARGB(195, 227, 227, 227),onPrimary: Color.fromARGB(255, 0, 0, 0)),
    ),
  );
  }


  Widget shirtscreen(){
    return SizedBox(
      height: 55,
      width: 114,
    child: ElevatedButton(
    child: Row(
    children:[
      Image.asset("images/s1.png",
      width: 40,
      height: 40,
      ),
      Text('  Shirt',style: TextStyle(fontSize: 16),),
    ],
    ),
    onPressed: (){
      Navigator.pushNamed(context, '/shoppingshirt');
      },
      style: ElevatedButton.styleFrom(primary: Color.fromARGB(195, 227, 227, 227),onPrimary: Color.fromARGB(255, 0, 0, 0)),
    ),
  );
  }

  Widget pantsscreen(){
    return SizedBox(
      height: 55,
      width: 122,
    child: ElevatedButton(
    child: Row(
    children:[
      Image.asset("images/p1.png",
      width: 40,
      height: 40,
      ),
      Text('  Pants',style: TextStyle(fontSize: 16),),
    ],
    ),
    onPressed: (){
      Navigator.pushNamed(context, '/shoppingpants');
      },
      style: ElevatedButton.styleFrom(primary: Color.fromARGB(195, 206, 160, 240),onPrimary: Color.fromARGB(255, 0, 0, 0)),
    ),
  );
  }

  Widget showscreen(){
  return Row(mainAxisSize:MainAxisSize.min ,
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
//   Widget pants1(){
//     return SizedBox(
//       height: 130,
//       width: 450,
//     child: ElevatedButton(
//     child: Row(
//     children:[
//       Image.asset("images/p1.png",
//       width: 120,
//       height: 120,
//       ),
//       Text('    M short jeans',style: TextStyle(fontSize: 25),),
//     ],
//     ),
//     onPressed: (){
//       Navigator.pushNamed(context, '/item');
//       },
//       style: ElevatedButton.styleFrom(primary: Color.fromARGB(195, 227, 227, 227),onPrimary: Color.fromARGB(255, 0, 0, 0)),
//     ),
//   );
// }

// Widget pants2(){
//     return SizedBox(
//       height: 130,
//       width: 450,
//     child: ElevatedButton(
//     child: Row(
//     children:[
//       Image.asset("images/p2.png",
//       width: 120,
//       height: 120,
//       ),
//       Text('    faded jeans',style: TextStyle(fontSize: 25),),
//     ],
//     ),
//     onPressed: (){
//       Navigator.pushNamed(context, '/item2');
//       },
//       style: ElevatedButton.styleFrom(primary: Color.fromARGB(195, 227, 227, 227),onPrimary: Color.fromARGB(255, 0, 0, 0)),
//     ),
//   );
// }
}