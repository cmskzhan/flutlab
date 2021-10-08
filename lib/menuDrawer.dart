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
      //Widget screen= Container();  
      menuItems.add(ListTile(
        title: Text(element),
        onTap:() {
          switch (element) {
            case "Page One":
              Navigator.pushNamed(context, "/first");
              break;
            case "Page Two":
              Navigator.pushNamed(context, "/second");
              break;
            case "Page Three":
              Navigator.pushNamed(context, "/third");
              break;
          }
          // Navigator.pop(context); //add it so after return from page1, menu won't be open
          // Navigator.push(context, MaterialPageRoute(builder: (context) {return screen;}));
        },
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