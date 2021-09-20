import 'package:flutter/material.dart';
import 'screen2.dart';
class Screen1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("1st screen"), backgroundColor: Colors.redAccent,),
      body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {return Screen2();}));
            },
            child: Text("go to 2nd Screen"),

      )),
      
    );
  }
}