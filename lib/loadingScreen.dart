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



class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getClass_Location_and_HttpAPI_JsonDecode();
  }

  // void getClassLoc() async {
  //   Location currentLoc = Location();
  //   await currentLoc.getCurrentGeoLocation();
  //   print(currentLoc.Latitude);
  //   print(currentLoc.Longitude);
  //   print(_geoloc[0]);
  //   print(_geoloc[1]);
  //}

  void getClass_Location_and_HttpAPI_JsonDecode() async {
    //1 . get location from Class Location below
    Location currentLoc = Location();
    await currentLoc.getCurrentGeoLocation();
    print(currentLoc.Latitude);
    print(currentLoc.Longitude);
    
    //2. construct URL
    var url = Uri(
      scheme: "https",
      host: 'api.openweathermap.org',
      path: '/data/2.5/weather',
      queryParameters: { "lat" : "${currentLoc.Latitude}", "lon" : "${currentLoc.Longitude}", "appid" : "3b7aee780a787b015e121593fedeb197" },
      );
      print(url.toString());
    // var url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=${currentLoc.Latitude}&lon=${currentLoc.Longitude}&appid=3b7aee780a787b015e121593fedeb197');
    
    //3. get json output from HTTP.get Class below
    HttpGet_JsonDecode jsonOut = HttpGet_JsonDecode(url);
    var weatherData = await jsonOut.getApi();
    print(weatherData.toString());
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationWeather(locationWeather: weatherData,);
      }));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Column(
          children: [
            SpinKitWave(size: 100, color: Colors.white),
            TextButton(onPressed: () {}, child: Text("click me"))
          ],
        ))
    );
  }
}

// customized classes to get locations and weatherMap API

// Getting Location
class Location {
  late double Latitude;
  late double Longitude;

  Future<List> getCurrentGeoLocation () async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      Latitude = position.latitude;
      Longitude = position.longitude;
      return [Latitude, Longitude];
    } catch (e) {
      print(e);
      return [e];
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