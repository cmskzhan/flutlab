import 'package:flutter/material.dart';
import 'package:helloworld/jsonData.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Demo2 extends StatefulWidget {
  const Demo2({ Key? key }) : super(key: key);

  @override
  _Demo2State createState() => _Demo2State();
}

class _Demo2State extends State<Demo2> {
  SharedPreferences? preferences;
  int count=1;

  final TextEditingController txtUsername = TextEditingController();
  final TextEditingController txtDuration = TextEditingController();
  User userSave = User();

  Future<void> initializePreference() async{
    preferences = await SharedPreferences.getInstance();
    preferences?.setString(count.toString(), "Peter");
  }

  String clearStorage()  {
    preferences!.clear();
    return "";
  }

  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key)??"");
  }

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
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
      body: Text("placeholder"),
      floatingActionButton: FloatingActionButton(onPressed: (){showInputDialog(context);}, child: Icon(Icons.add),),
    );
  }



  Future<dynamic> showInputDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Input time, location, service, duration"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(controller: txtUsername, decoration: InputDecoration(hintText: "Description"),),
                TextField(controller: txtDuration, decoration: InputDecoration(hintText: "Duration"),),
              ],
            ),
            
            ),
          actions: [
            TextButton(onPressed: () {Navigator.pop(context);}, child: Text('Cancel')),
            ElevatedButton(
              onPressed: (){
                userSave.id = count;
                userSave.username=txtUsername.text;
                userSave.duration=int.parse(txtDuration.text);
                userSave.date = "2020-10-20";
                save(txtUsername.text, userSave);
                count++;
                Navigator.pop(context);}, 
              child: Text('Save'))
          ],
        );
      }
    );
  }
}




