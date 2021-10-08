import 'package:flutter/material.dart';
import 'bottomNavBar.dart';
import 'menuDrawer.dart';

class Page1 extends StatelessWidget {
  const Page1({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page One")) ,
      drawer: MenuDraw(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(
            "https://i0.wp.com/flutteragency.com/wp-content/uploads/2020/10/iOS-Emulator.png"), fit: BoxFit.fitHeight
            )
        ),),
      bottomNavigationBar: BottomNavBar()
    );
  }
}