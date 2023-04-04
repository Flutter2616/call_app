import 'package:call_app/screen/add_screen.dart';
import 'package:call_app/screen/contact_screen.dart';
import 'package:call_app/screen/dash_screen.dart';
import 'package:call_app/screen/profile_screen.dart';
import 'package:call_app/screen/recent_screen.dart';
import 'package:call_app/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.blue,
    ),
  );
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => Splashscreen(),
        'dash':(context) => Dashscreen(),
        'contact':(context) => ContactScreen(),
        'add':(context) => Addscreen(),
        'profile':(context) => Profilescreen(),
      },
      // home: Splashscreen(),
    ),
  );
}
