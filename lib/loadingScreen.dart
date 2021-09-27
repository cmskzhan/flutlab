import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({ Key? key }) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}
  void getGeoLocation() async { 
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      print(position);
    } catch (e) {
      print(e);
    }
  }

  void getHttpResp() async {
    var url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=3b7aee780a787b015e121593fedeb197');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }



class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getClassLoc();
  }

  void getClassLoc() async {
    Location currentLoc = Location();
    await currentLoc.getCurrentGeoLocation();
    print(currentLoc.Latitude);
    print(currentLoc.Longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: TextButton(child: Text("location"), onLongPress: () {getHttpResp();}, onPressed: () {getGeoLocation();},)),
    );
  }
}

// customized classes to get locations and weatherMap API

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