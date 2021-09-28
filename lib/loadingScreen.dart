import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'locationWeatherScreen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({ Key? key }) : super(key: key);

  

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}
  final String urlString = 'https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=3b7aee780a787b015e121593fedeb197';
  void getGeoLocation() async { 
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      print(position);
    } catch (e) {
      print(e);
    }
  }

  void getHttpResp() async {
    var url = Uri.parse(urlString);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var temperature = jsonDecode(response.body)['main']['temp'];
      var weather = jsonDecode(response.body)['weather'][0]['id'];
      var name = jsonDecode(response.body)['name'];
      print(weather.runtimeType);
      print('$weather, $temperature, $name');
    } else {
      print('Response status: ${response.statusCode}');
    }
  }



class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    combineAbove2methods();
  }

  void getClassLoc() async {
    Location currentLoc = Location();
    await currentLoc.getCurrentGeoLocation();
    print(currentLoc.Latitude);
    print(currentLoc.Longitude);
  }

  void getClassHttp_JsonDecode() async {
    var url = Uri.parse(urlString);
    HttpGet_JsonDecode jsonOut = HttpGet_JsonDecode(url);
    var weatherData = await jsonOut.getApi();
    print(weatherData.toString());
  }

  void combineAbove2methods() {
    getClassLoc();
    getClassHttp_JsonDecode();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            children: [
              TextButton(
        child: Text("location"),
        onLongPress: () {
              getHttpResp();
        },
        onPressed: () {
              getGeoLocation();
              Navigator.push(context, MaterialPageRoute(builder: (context) {return LocationWeather();}));
        },
      ),
      SpinKitWave(size: 100, color: Colors.blue)
            ],
          )),
    );
  }
}

// customized classes to get locations and weatherMap API

// Getting Location
class Location {
  late double Latitude;
  late double Longitude;

  Future<void> getCurrentGeoLocation () async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      Latitude = position.latitude;
      Longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
// Getting weather from API
class HttpGet_JsonDecode {
  HttpGet_JsonDecode(this.url); //takes URL as parameter
  final Uri url;

  Future getApi() async {
    http.Response resp = await http.get(url);
    if (resp.statusCode == 200) {
      return jsonDecode(resp.body);
    } else {
      print(resp.statusCode);
    }
  }
}