import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/screens/location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // without this MAGIC will be error: Vấn đề: Navigator.pushReplacement được gọi trong initState, khi LoadingScreen chưa được xây dựng xong. Điều này vi phạm quy tắc của Flutter về việc không thay đổi cấu trúc widget trong giai đoạn xây dựng.
      getLocationData();
    });
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => LocationScreen(locationWeather: weatherData)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
