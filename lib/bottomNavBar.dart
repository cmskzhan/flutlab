import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'P3',),
        BottomNavigationBarItem(icon: Icon(Icons.monitor_weight), label: 'P1'),
        BottomNavigationBarItem(icon: Icon(Icons.monitor_weight), label: 'P2'),
      ],
    );
  }
}