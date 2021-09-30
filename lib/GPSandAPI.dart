import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// getting GPS coordinates
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