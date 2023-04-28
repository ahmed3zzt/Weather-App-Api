import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherProvider with ChangeNotifier {
  WeatherModel? _weather;
  String? cityName;
  set weather(WeatherModel? weather) {
    _weather = weather;
    notifyListeners();
  }

  WeatherModel? get weather => _weather;
}
