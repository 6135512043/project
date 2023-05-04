import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:app1/route.dart';

class Register extends StatefulWidget {
  const Register({ Key? key }) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}
class Profile {
  var email = "";
  var password = "";
}

class _RegisterState extends State<Register> {
  Profile profile = new Profile();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Error'),
              ),
              body: Center(child: Text("${snapshot.error}")),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Color.fromARGB(255, 160, 58, 190),
                title: Text('Register'),
              ),
              body: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(50.0),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Image.network(
                              "https://cdn1.iconfinder.com/data/icons/unicons-line-vol-6/24/user-plus-512.png",
                              height: 200,
                              width: 150,
                            ),
                          TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              validator: (var inValue) {
                                if (inValue!.length == 0) {
                                  return "Please enter email";
                                }
                                return null;
                              },
                              onSaved: (var email) {
                                profile.email = email!;
                              },
                              decoration: InputDecoration(
                                  // hintText: "none@none.com",
                                  labelText: "Email")),
                          TextFormField(
                              obscureText: true,
                              validator: (var inValue) {
                                if (inValue!.length == 0) {
                                  return "Please enter passwoed";
                                }
                                return null;
                              },
                              onSaved: (var password) {
                                profile.password = password!;
                              },
                              
                              decoration: InputDecoration(
                                  
                                  labelText: "Password")),
                        SizedBox(
                          height: 20,),
                          SizedBox(
                            
                            child: ElevatedButton(
                              
                              child: Text('Register'),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  try {
                                    await FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                      email: profile.email,
                                      password: profile.password,
                                    )
                                        .then((value) {
                                      Fluttertoast.showToast(
                                        msg: "Successful registration",
                                        gravity: ToastGravity.CENTER,
                                      );

                                      _formKey.currentState!.reset();
                                      Navigator.pushNamed(context, '/login');
                                    });
                                  } on FirebaseAuthException catch (e) {
                                    /*Fluttertoast.showToast(
                                      msg: e.message,
                                      gravity: ToastGravity.CENTER,
                                    );*/
                                  }
                                }
                              },
                            ),
                          )
                        ],
                      )),
                ),
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}