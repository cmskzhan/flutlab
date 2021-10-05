import 'package:flutter/material.dart';

class MenuDraw extends StatelessWidget {
  const MenuDraw({ Key? key }) : super(key: key);

  List<Widget> buildMenuItems(BuildContext context){
    List<String> menuTitles = [
      'Page One',
      'Page Two',
      'Page Three',
      'Page Four'
    ];
    List<Widget> menuItems = [];
    menuItems.add(DrawerHeader(child: Text("KKK"))); //add header to menuItems
    menuTitles.forEach((element) { // add sub page titles
      menuItems.add(ListTile(
        title: Text(element),
      ));
      });
      return menuItems;
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: buildMenuItems(context),),   
    );
  }
}