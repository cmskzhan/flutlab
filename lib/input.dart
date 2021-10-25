// Reference from https://medium.com/mellow-code-labs/future-builders-along-with-listview-builders-in-your-flutter-app-6656976edeb7

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListViewBuilder extends StatefulWidget {
  const ListViewBuilder({ Key? key }) : super(key: key);

  @override
  _ListViewBuilderState createState() => _ListViewBuilderState();
}

class _ListViewBuilderState extends State<ListViewBuilder> {

  Future getAllTodos() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/todos');
    final http.Response response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Left swipe ListView Future Demo"),),
      body: Column(
        children: [
          TextButton(onPressed: (){getAllTodos().then((value) => print(value));}, child: Text("getAllTodos values in console")),
          Expanded(
            child: FutureBuilder(
              builder: (context, AsyncSnapshot snapshot) {
                // WHILE THE CALL IS BEING MADE AKA LOADING
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
          
                // WHEN THE CALL IS DONE BUT HAPPENS TO HAVE AN ERROR
                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                }
          
          
                // IF URL WORKS IT GOES HERE!
                return ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  separatorBuilder: (BuildContext context, int index) => const Divider(),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    final item = snapshot.data[index].toString();
                    return Dismissible(
                      key: Key(item),
                      child: ListTile(
                        title: Text(snapshot.data[index]['title']),
                        subtitle: Text(snapshot.data[index].toString()),
                      ),
                    );
                  },);
              },
              future: getAllTodos(),
              ),
          ),
        ],
      ),
      
    );
  }
}