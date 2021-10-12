import 'package:flutter/material.dart';
import 'package:helloworld/AddItemPage/session.dart';
import 'package:helloworld/AddItemPage/sp_helper.dart';


class InputScreen extends StatefulWidget {
  const InputScreen({ Key? key }) : super(key: key);

  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final TextEditingController txtDescription = TextEditingController();
  final TextEditingController txtDuration = TextEditingController();
  SPHelper helper = SPHelper() ;
  List<Session> items = [];

  @override
  void initState() {
    helper.init();
    // updateUI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add stuff")),
      body: ListView(children: getContent()),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add',
        child: Icon(Icons.add_to_drive),
        onPressed: () {showInputDialog(context);},
      ),

      
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
            ElevatedButton(onPressed: saveOnPressed, child: Text('Submit'))
          ],
        );
      }
    );
  }
  Future saveOnPressed() async {
    DateTime now = DateTime.now();
    String today = "${now.year}-${now.month}-${now.day}";
    Session newItem = Session(1, today, txtDescription.text, int.tryParse(txtDuration.text)??0);
    helper.writeSession(newItem);
    Navigator.pop(context);
    print(today);
    print(newItem.toJson());
  }

  List<Widget> getContent() {
    List<Widget> tiles = [];
    items.forEach((item) {
      print(item.toJson());
      tiles.add(ListTile(
        title: Text(item.description),
        subtitle: Text('${item.date} - duration: ${item.duration} mins'),
      ));
     });
     return tiles;
  }

  void updateUI() {
    items = helper.getSessions();
  }
}

