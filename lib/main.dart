import 'package:flutter/material.dart';
import 'root.dart';
import 'screen1.dart';
import 'screen2.dart';
import 'screen3.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        '/': (context) => Screen0(),
        '/first': (context) => Screen1(),
        '/second': (context) => Screen2(),
        '/third': (context) => Screen3(),
      },
    );
  }
}
