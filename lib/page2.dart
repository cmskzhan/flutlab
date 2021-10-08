import 'package:flutter/material.dart';
import 'menuDrawer.dart';
import 'bottomNavBar.dart';

class Page2 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page Two")) ,
      drawer: MenuDraw(),
      body: FlutterLogo(textColor: Colors.green,),
      bottomNavigationBar: BottomNavBar()
    );
  }
}