import 'package:flutter/material.dart';
import 'menuDrawer.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //routes: {},
        home: Scaffold(
          backgroundColor: Colors.amberAccent,
          drawer: MenuDraw(),        
          appBar: AppBar(
            title: Text('I Am Rich'),
            backgroundColor: Colors.redAccent,
          ),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://i0.wp.com/flutteragency.com/wp-content/uploads/2020/10/iOS-Emulator.png"),
                  fit: BoxFit.cover),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white10),
                  child: Center(
                    child: Image(
                      image: AssetImage('images/CaptureBBC.JPG'),
                    ),
                  ),
                ),
                Text('Ladies and gentlemen, \n you coulda been anywhere in the world tonight \n but you’re here with us in New York City',
                     textAlign: TextAlign.center,                     
                     style: TextStyle(
                      fontSize: 18, color: Colors.white,
                      shadows: [
                        Shadow(offset: Offset(1.0, 1.0), blurRadius: 4.0, color: Colors.greenAccent)
                      ]),
                     ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.monitor), label: 'P1'),
            BottomNavigationBarItem(icon: Icon(Icons.monitor), label: 'P2')
          ],
            onTap: (int index) {
              switch (index) {
                case 0: 
                  Navigator.pushNamed(context, '/');                  
                  break;
                 case 1: 
                  Navigator.pushNamed(context, '/first');                  
                  break;
                case 2: 
                  Navigator.pushNamed(context, '/second');                  
                  break;
              }

          }),
        ),
      );
  }
}