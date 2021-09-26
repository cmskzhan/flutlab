import 'package:flutter/material.dart';

class Screen0 extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.purpleAccent, title: Text("Root"),),
      body: Column(
        children: [ElevatedButton(onPressed: () {Navigator.pushNamed(context, '/first');}, child: Text("To screen 1"),),
                   ElevatedButton(onPressed: () {Navigator.pushNamed(context, '/second');}, child: Text("To screen 2"),),
                   ElevatedButton(onPressed: () {Navigator.pushNamed(context, '/third');}, child: Text("To screen 3"),)],
      ),
      
    );
  }
}