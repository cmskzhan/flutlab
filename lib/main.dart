import 'package:flutter/material.dart';
import 'package:helloworld2/page1.dart';
import 'package:helloworld2/page2.dart';
import 'package:helloworld2/page3.dart';
import 'landingPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        '/': (context) => LandingPage(),
        '/first': (context) => Page1(),
        '/second': (context) => Page2(),
        '/third': (context) => Page3(),
      },
    );
  }
}




