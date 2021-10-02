class WeatherModel {
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else if (temp < -273){
      return 'ERROR ';
    } else
      return 'Bring a 🧥 just in case';
    
  }

  // Future<dynamic> GetNewLocationWeather() async {
  //   Location location = Location();
  //   await location.getCurrentGeoLocation();
  //     var newurl = Uri(
  //     scheme: "https",
  //     host: 'api.openweathermap.org',
  //     path: '/data/2.5/weather',
  //     queryParameters: { "lat" : "${location.Latitude}", 
  //                       "lon" : "${location.Longitude}", 
  //                       "appid" : "3b7aee780a787b015e121593fedeb197",
  //                       "units" : "metric" },
  //     );
    
  //   HttpGet_JsonDecode updatedJson = HttpGet_JsonDecode(newurl);
  //   var newJson = updatedJson.getApi();
  //   return newJson;

  // }



}
