import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Demo2 extends StatefulWidget {
  const Demo2({ Key? key }) : super(key: key);

  @override
  _Demo2State createState() => _Demo2State();
}

class _Demo2State extends State<Demo2> {
  SharedPreferences? preferences;
  int count=1;

  final TextEditingController txtDescription = TextEditingController();
  final TextEditingController txtDuration = TextEditingController();

    Future<void> initializePreference() async{
     preferences = await SharedPreferences.getInstance();
     preferences?.setString(count.toString(), "Peter");
    }

    String clearStorage()  {
      preferences!.clear();
      return "";
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
                TextField(controller: txtDescription, decoration: InputDecoration(hintText: "Description"),),
                TextField(controller: txtDuration, decoration: InputDecoration(hintText: "Duration"),),
              ],
            ),
            
            ),
          actions: [
            TextButton(onPressed: () {Navigator.pop(context);}, child: Text('Cancel')),
            ElevatedButton(onPressed: (){}, child: Text('Submit'))
          ],
        );
      }
    );
  }
}




