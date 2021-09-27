import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

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
        body: Center(child: TextButton(child: Text("location"), onPressed: () {getGeoLocation();},)),
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