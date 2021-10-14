import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Demo2 extends StatefulWidget {
  const Demo2({ Key? key }) : super(key: key);

  @override
  _Demo2State createState() => _Demo2State();
}

class _Demo2State extends State<Demo2> {
  final TextEditingController txt1 = TextEditingController();
  String showtxt1 = "initial value";
  SharedPreferences? preferences;

    Future<void> initializePreference() async{
     preferences = await SharedPreferences.getInstance();
     preferences?.setString("name", "Peter");
    }

  @override
  void initState() {
    initializePreference().whenComplete(() {setState(() {});});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("test shared_pref package"),),
      body: Column(children: [
        Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                controller: txt1, 
                decoration: InputDecoration(hintText: "txt1"),
              ),
            ),
        Padding(padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    Text(showtxt1),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          showtxt1 = txt1.text;
                        });
                        }, 
                      child: Text("show"))
                  ],
                ),),
                Text('The user is ${preferences?.getString("name")}')
      
      ],)
      
    );
  }
}




