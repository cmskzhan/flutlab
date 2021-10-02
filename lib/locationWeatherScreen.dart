import 'package:flutter/material.dart';
import 'weather.dart';
import 'GPSandAPI.dart';
import 'inputLocatonGetWeather.dart';

class LocationWeather extends StatefulWidget {
  final locationWeather;
  LocationWeather({this.locationWeather});

  @override
  _LocationWeatherState createState() => _LocationWeatherState();
}

class _LocationWeatherState extends State<LocationWeather> {
  
  late int temperature;
  var weather;
  var cityname;
  WeatherModel wd = WeatherModel();
  var weatherIcon;
  late String greeting;

  @override
  void initState() {
    super.initState();

    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    temperature = weatherData['main']['temp'].toInt(); //get rid of decimal
    weather = weatherData['weather'][0]['id'];
    cityname = weatherData['name'];

    weatherIcon = wd.getWeatherIcon(weather);
    greeting = wd.getMessage(temperature);

  }

  void updateGPSandWeather() async {
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
      queryParameters: { "lat" : "${currentLoc.Latitude}", 
                        "lon" : "${currentLoc.Longitude}", 
                        "appid" : "3b7aee780a787b015e121593fedeb197",
                        "units" : "metric" },
      );

    //3. get json output from HTTP.get Class below
    HttpGet_JsonDecode jsonOut = HttpGet_JsonDecode(url);
    var weatherData = await jsonOut.getApi();
    if (weatherData == null) {
      temperature = -274;
      weather = 0;
      cityname = " GPS or API failed";
    }
    print(weatherData.toString());
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationWeather(locationWeather: weatherData,);
      }));
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
                TextButton(onPressed: () {updateGPSandWeather();}, child: Icon(Icons.near_me, size: 50.0,),),
                TextButton(onPressed: () async {
                      var typeName = await Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return CityScreen();
                      }));
                      print("returned pop value is $typeName");
                }, child: Icon(Icons.location_city, size: 50.0,),),
              ],
            ),
            Padding(padding: EdgeInsets.fromLTRB(20, 20, 20, 20), child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(temperature.toString(), style: TextStyle(fontSize: 100), textAlign: TextAlign.right,),
                Text(weatherIcon, style: TextStyle(fontSize: 100),)
              ],
            ),),
            Padding(padding: EdgeInsets.only(right: 14.8), child: Text("$greeting in $cityname", style: TextStyle(fontSize: 20),),)
          ],
        ),),),
    );
  }
}