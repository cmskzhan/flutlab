import 'package:flutter/material.dart';
import 'locationWeatherScreen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'GPSandAPI.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final String urlString = 'https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=3b7aee780a787b015e121593fedeb197';
  @override
  void initState() {
    super.initState();
    getClass_Location_and_HttpAPI_JsonDecode();
  }


  void getClass_Location_and_HttpAPI_JsonDecode() async {
    //1 . get location from Class Location below
    Location currentLoc = Location();
    await currentLoc.getCurrentGeoLocation();
    print(currentLoc.Latitude);
    print(currentLoc.Longitude);
    
    //2. construct URL
    // var url = Uri(
    //   scheme: "https",
    //   host: 'api.openweathermap.org',
    //   path: '/data/2.5/weather',
    //   queryParameters: { "lat" : "${currentLoc.Latitude}", 
    //                     "lon" : "${currentLoc.Longitude}", 
    //                     "appid" : "3b7aee780a787b015e121593fedeb197",
    //                     "units" : "metric" },
    // );
    var url = Uri.parse(urlString);

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
