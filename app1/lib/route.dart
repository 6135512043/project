import 'package:app1/home.dart';
import 'package:app1/login.dart';
import 'package:app1/register.dart';
import 'package:app1/Welcome.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  '/register': (BuildContext context) => Register(),
  '/login': (BuildContext context) => login(),
  '/home': (BuildContext context) => Home(),
  '/Welcome': (BuildContext context) => HomePageWidget(),
};