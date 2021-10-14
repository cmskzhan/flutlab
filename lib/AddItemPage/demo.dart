import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'jsonSaveLoadLocal.dart';
import 'from2json.dart';

class DemoScreen extends StatefulWidget {
  const DemoScreen({Key? key}) : super(key: key);

  @override
  _DemoScreenState createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  // SharedPref _sharedPref = SharedPref();
  final TextEditingController txtName = TextEditingController();
  final TextEditingController txtLocation = TextEditingController();
  final TextEditingController intAge = TextEditingController();

  Users newPerson = Users();

  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Demo add user")),
      body: ListView(children: []),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add',
        child: Icon(Icons.add_to_queue),
        onPressed: () {showInputDialog(context);print(newPerson.toJson());},),
    );
  }

  Future<dynamic> showInputDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Input user info"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(controller: txtName, decoration: InputDecoration(hintText: "Description"),),
                TextField(controller: intAge, decoration: InputDecoration(hintText: "Age"), keyboardType: TextInputType.number,), //inputFormatters digital only
                TextField(controller: txtLocation, decoration: InputDecoration(hintText: "Location"),),
              ],
            ),
            
            ),
          actions: [
            TextButton(onPressed: () {print(intAge.text); Navigator.pop(context);}, child: Text('Cancel')),
            ElevatedButton(
              onPressed: (){
                newPerson.id = 1;
                newPerson.name = txtName.text;
                newPerson.location = txtLocation.text;
                newPerson.age = int.parse(intAge.text);
                print(newPerson.toJson());
                 },
              child: Text('Submit'))
          ],
        );
      }
    );
  }









}
