// Page
import 'package:clima/services/networking.dart';
import 'package:clima/screens/location_screen.dart';

// Key
const apiKey = 'secret key';
const openWeatherMapURL = 'http://api.openweathermap.org/data/2.5/forecast';

class WeatherModel {
  // location_screen.dart에 있는 것으로는 입력한 도시의 날씨를 불러올 수 없다.
  // getCityWeather 메소드에 입력한 도시의 날씨를 불러올 수 있게 했다.
  // 반환하는 weatherData는 동적 출력, 역동적인 결과를 가져오기 때문에 Future<dynamic>을 쓴다.
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        // openWeatherMap api docs 참고
        // ?q=를 통해 도시 이름을 넣을 수 있다.
        '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');

    // getData는 비동기적이기 때문에 비동기 메서드로 표시한다.
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

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
