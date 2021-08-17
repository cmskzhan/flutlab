import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.amberAccent,
          appBar: AppBar(
            title: Text('I Am Rich'),
            backgroundColor: Colors.redAccent,
          ),
          body: Center(
            child: Image(
              image: NetworkImage('https://media-exp1.licdn.com/dms/image/C4D03AQEdHrby2IzlZg/profile-displayphoto-shrink_400_400/0/1516542582287?e=1634774400&v=beta&t=6greFQvped7cSa0ayFxSxPuAOKAmqV5xhfrdnKYOHI4'),
            ),
          ),
        ),
      ),
    );
