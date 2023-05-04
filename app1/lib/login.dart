import 'package:app1/welcome.dart';
import 'package:app1/Welcome2.dart';
import 'package:app1/home.dart';
import 'package:app1/register.dart';
import 'package:app1/setting.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:app1/route.dart';

class login extends StatefulWidget {
  const login({ Key? key }) : super(key: key);

  @override
  State<login> createState() => _loginState();
}
class Profile {
  var email = "";
  var password = "";
}

class _loginState extends State<login> {
  Profile _profile = new Profile();
   GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
                  title: Text('Login'),
                ),
                body: SingleChildScrollView(
                  child: Container(
                      padding: EdgeInsets.all(50.0),
                      child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                            Image.network(
                              "https://cdn-icons-png.flaticon.com/512/4213/4213147.png",
                              height: 200,
                              width: 150,
                            ),
                            TextFormField(
                              validator: (var value) {
                                if (value!.length==0 ) {
                                  return "Press enter email";
                                }
                              },
                              onSaved: (var value) {
                                _profile.email =value!;
                              },
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.email),
                                    hintText: "none@none.com",
                                    labelText: "Email"),),
                            TextFormField(
                              validator: (var value) {
                                if (value!.length<6 ) {
                                  return "Press enter password > 6";
                                }
                              },
                              onSaved: (var value) {
                                _profile.password =value!;
                              },
                                obscureText: true,
                                
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.lock),
                                    labelText: "Password")),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                    child: Text("Login"),
                                    onPressed: () async {
                                     if (_formKey.currentState!.validate()) {
                                       _formKey.currentState!.save();
                                      try {
                                       await FirebaseAuth.instance.signInWithEmailAndPassword(email: _profile.email, password: _profile.password).then(
                                         (value) {
                                           _formKey.currentState!.reset();
                                            MaterialPageRoute route =
                                                MaterialPageRoute(
                                              builder: (context) => HomePageWidget2(),
                                            );
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                route,
                                                (route) => false);
                                         } );
                                      } on FirebaseAuthException catch (e) {
                                        
                                      }
                                     }
                                    }),
                                SizedBox(
                                  width: 20,
                                ),
                                ElevatedButton(
                                    child: Text("Register"),
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/register');
                                    }),
                              ],
                            ),
                          ]))),
                ));
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}