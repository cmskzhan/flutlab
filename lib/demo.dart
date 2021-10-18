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
  int count=1;

    Future<void> initializePreference() async{
     preferences = await SharedPreferences.getInstance();
     preferences?.setString(count.toString(), "Peter");
    }

    void printStorage() async {

        for (int i=1; i<=count; i++) {
          preferences = await SharedPreferences.getInstance();
          String _displayAllLocal = preferences?.getString(i.toString())??"null";
          String _displayAllLocal_withIndex = i.toString() + ": " + _displayAllLocal + "\n";
          print(_displayAllLocal_withIndex);
      }
    }


  @override
  void initState() {
    initializePreference().whenComplete(() {setState(() {});});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String showtxt2 = preferences?.getString(count.toString())??"null";
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
                        count++;
                        printStorage();
                        setState(() {
                          showtxt1 = txt1.text;
                          preferences?.setString(count.toString(), showtxt2 +"\n"+txt1.text)??showtxt1;
                        });
                        }, 
                      child: Text("show"))
                  ],
                ),),
        Text('The shared_preferences locally stored value is $showtxt2')
      ],)
      
    );
  }
}




