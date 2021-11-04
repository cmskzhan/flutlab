import 'package:flutter/material.dart';
import 'same_variable_multiple_animations.dart';
import 'sequence_page.dart';
import 'staggered_animation_replication.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '3rd party animation',
      theme: ThemeData(primaryColor: Colors.blue),
      initialRoute: "/",
      routes: {
        '/': (context) => HomePage(),
        '/sequence': (context) => SequencePage(),
        '/StaggeredAnimationReplication': (context) => StaggeredAnimationReplication(),
        '/SameVariableAnimationPage': (context) => SameVariableAnimationPage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animation Example"),),
      body: Center(child: Column(
        children: [
          ElevatedButton(onPressed: () {Navigator.pushNamed(context, '/sequence');}, child: Text("Sequence")),
          ElevatedButton(onPressed: () {Navigator.pushNamed(context, '/StaggeredAnimationReplication');}, child: Text("StaggeredAnimationReplication")),
          ElevatedButton(onPressed: () {Navigator.pushNamed(context, '/SameVariableAnimationPage');}, child: Text("SameVariableAnimationPage")),
        ],
      )),
    );
  }
}
