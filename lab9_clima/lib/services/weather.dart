import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/services/api_key.dart';

const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    String encodedCityName = Uri.encodeComponent(cityName); // Mã hóa tên thành phố
    // Dấu cách sẽ là %20
    String url = '$openWeatherMapURL?q=$encodedCityName&appid=$apiKey&units=metric';
    print('City $url');
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location);
    if (location.latitude == null || location.longitude == null) {
      return null;
    }
    String url = '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric';
    print('HERE : $url');
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

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
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
