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
    //preferences?.setString(count.toString(), "Peter");
  }

  // String clearStorage()  {
  //   preferences!.clear(); //! indicates I'm sure it won't be null
  //   return "";
  // }

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

  clear() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  Future readAll() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();
    var fullList = [];
    for (String key in keys){
      fullList.add(prefs.get(key));
    }
    
    return json.decode(fullList.toString());
  }

  countList() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();
    print(keys.length);
    return keys.length;
  }

  void printStorageContent() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();
    for (String key in keys) {
      print(key);
      print(prefs.get(key).toString());
    }

  }


  // @override
  // void initState() {
  //   initializePreference().whenComplete(() {setState(() {});});
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("test shared_pref package"),),
      body: Column(
        children: [
          Row(
            children: [
              TextButton(onPressed: () {printStorageContent();}, child: Text("print all records in console")),
              TextButton(onPressed: () {clear();}, child: Text("clear all records")),
              TextButton(onPressed: () {print(countList());}, child: Text("records no")),
            ],
          ),
          TextButton(onPressed: () {readAll().then((value) => print(value)); print(readAll());}, child: Text("print all records as list")),
          TextButton(onPressed: () {setState(() { });}, child: Text("refresh")),
          
          FutureBuilder(
            future: readAll(),
            builder: (context, AsyncSnapshot snapshot){
              if (!snapshot.hasData) {
                return Text("No data");
              } else {
                print(snapshot.data.toString());
              return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index){
                  print(index);        
                  return Dismissible(
                    key: UniqueKey(),
                    onDismissed:(direction) {setState(() {
                      remove(snapshot.data[index]['username']); //key is username when saved
                    });},
                    child: ListTile(
                      title: Text(snapshot.data[index]['username']), 
                      subtitle: Text(snapshot.data![index].toString()),
                      ),
                  );
                }); 
                }
            },)

        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){showInputDialog(context);}, child: Icon(Icons.add), heroTag: "addButton",),

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




