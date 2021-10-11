import 'package:flutter/material.dart';
import 'sp_helper.dart';
import 'session.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({ Key? key }) : super(key: key);

  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add stuff")),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add',
        child: Icon(Icons.add_to_drive),
        onPressed: () {},
      ),

      
    );
  }
}