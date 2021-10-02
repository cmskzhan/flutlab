import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({ Key? key }) : super(key: key);

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName = "Japan";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(
          image: AssetImage('images/city_background.jpg'),
          fit: BoxFit.cover)),
        child: SafeArea(child: Column(
          children: [
            Align(alignment: Alignment.topLeft,
            child: TextButton(
              child: Icon(Icons.arrow_back_ios, size: 50),
              onPressed: () {Navigator.pop(context);},
              ),),
            Container(
              padding: EdgeInsets.all(20), 
              child: TextField(
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
                onChanged: (inputText) {cityName = inputText;},
                decoration: InputDecoration(
                  fillColor: Colors.white, 
                  hintText: "Enter City Name",  
                  hintStyle: TextStyle(color: Colors.grey),
                  hintTextDirection: TextDirection.rtl,
                  icon: Icon(Icons.location_city),
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),),
            TextButton(onPressed: () {Navigator.pop(context, cityName);}, child: Text("Get Weather", style: TextStyle(fontSize: 50),))
          ],
        ),),),
    );
  }
}