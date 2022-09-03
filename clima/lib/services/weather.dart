// Page
import 'package:clima/services/networking.dart';
import 'package:clima/screens/location_screen.dart';

// Key
const apiKey = '21a6f5286891dd8ccc2a942880607c6e';
const openWeatherMapURL = 'http://api.openweathermap.org/data/2.5/forecast';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();

    await location.getCurrentLocation();

    // // 위,경도 출력
    print(location.latitude);
    print(location.longtitude);

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longtitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 600) {
      return '🌧';
    } else if (condition < 700) {
      return '🌨';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '🌞';
    } else if (condition < 805) {
      return '☁';
    } else {
      return '❔';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'it\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for 🩳 and 👕 ';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
