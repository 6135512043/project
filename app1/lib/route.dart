import 'package:app1/Welcome2.dart';
import 'package:app1/home.dart';
import 'package:app1/item.dart';
import 'package:app1/item2.dart';
import 'package:app1/login.dart';
import 'package:app1/register.dart';
import 'package:app1/shoppingpants.dart';
import 'package:app1/shoppingshirt.dart';
import 'package:app1/welcome.dart';
import 'package:app1/relogin.dart';
import 'package:app1/setting.dart';
import 'package:app1/shopping.dart';
import 'package:flutter/material.dart';


final Map<String, WidgetBuilder> routes = {
  '/register': (BuildContext context) => Register(),
  '/login': (BuildContext context) => login(),
  '/home': (BuildContext context) => Home(),
  '/welcome': (BuildContext context) => HomePageWidget(),
  '/setting': (BuildContext context) => Setting(),
  '/Welcome2': (BuildContext context) => HomePageWidget2(),
  '/shopping': (BuildContext context) => Shopping(),
  // '/item': (BuildContext context) => Showmodel(),
  '/relogin': (BuildContext context) => Relogin(),
  '/item2': (BuildContext context) => item2(),
  '/shoppingshirt': (BuildContext context) => shoppingshirt(),
  '/shoppingpants': (BuildContext context) => shoppingpants(),
};