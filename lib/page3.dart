import 'package:flutter/material.dart';
import '../menuDrawer.dart';
import '../bottomNavBar.dart';

class Page3 extends StatelessWidget {
  const Page3({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page Three"), backgroundColor: Colors.black87,) ,
      drawer: MenuDraw(),
      body: FlutterLogo(textColor: Colors.green,),
      bottomNavigationBar: BottomNavBar()
    );
  }
}