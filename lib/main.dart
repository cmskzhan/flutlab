import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/login.dart';
import 'screens/registration.dart';
import 'screens/chat.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  const FlashChat({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black54)
        )
      ),
      home: LoginScreen(),
    );
  }
}