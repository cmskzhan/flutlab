import 'package:flutter/material.dart';

class LocationWeather extends StatefulWidget {
  final locationWeather;
  LocationWeather({this.locationWeather});

  @override
  _LocationWeatherState createState() => _LocationWeatherState();
}

class _LocationWeatherState extends State<LocationWeather> {
  var temperature;
  var weather;
  var cityname;

  @override
  void initState() {
    super.initState();

    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    temperature = weatherData['main']['temp'].toInt(); //get rid of decimal
    weather = weatherData['weather'][0]['id'];
    cityname = weatherData['name'];

  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage("https://cdn3.vectorstock.com/i/thumb-large/36/77/small-hearts-on-black-background-vector-18823677.webp"),
          fit: BoxFit.cover),
          
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: () {}, child: Icon(Icons.near_me, size: 50.0,),),
                TextButton(onPressed: () {}, child: Icon(Icons.location_city, size: 50.0,),),
              ],
            ),
            Padding(padding: EdgeInsets.fromLTRB(20, 20, 20, 20), child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(temperature.toString(), style: TextStyle(fontSize: 100), textAlign: TextAlign.right,),
                Text("☀️", style: TextStyle(fontSize: 100),)
              ],
            ),),
            Padding(padding: EdgeInsets.only(right: 14.8), child: Text("It's 🍦 time in $cityname", style: TextStyle(fontSize: 25),),)
          ],
        ),),),
    );
  }
}