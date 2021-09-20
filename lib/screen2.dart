import 'package:flutter/material.dart';
class Screen2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("2nd screen"), backgroundColor: Colors.blue,),
      body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("go back to 1st Screen"),

      )),
      
    );
  }
}