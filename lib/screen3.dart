import 'package:flutter/material.dart';

class Screen3 extends StatefulWidget {

  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  void initState() {
    print("initState Called");
  }

  @override
  void deactivate() {
    print("deactivate called");
  }


  @override
  Widget build(BuildContext context) {
    print("build Called");
    return Scaffold(
      appBar: AppBar(title: Text("Stateful Screen3"),),
      body: Text("This is a stateful screen, \ncheck console output for \ninitState, \nbuildState and \nDeactiveState call timing"),
    );
  }
}