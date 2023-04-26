import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather_model.dart';

class WeatherService {
  Future<WeatherModel> getWeather({required String cityName}) async {
    String baseUrl = 'http://api.weatherapi.com/v1';
    String apiKey = "dd3b016a9dd24c258d4114924232504";

    Uri url = Uri.parse("$baseUrl/forecast.json?key=$apiKey&q=$cityName");

    http.Response response = await http.get(url);

    Map<String, dynamic> data = jsonDecode(response.body);

    String date = data['location']['localtime'];
    double temp = data['forecast']['forecastday'][0]['avgtemp_c'];
    double minTemp = data['forecast']['forecastday'][0]['mintemp_c'];
    double maxTemp = data['forecast']['forecastday'][0]['maxtemp_c'];
    String condition = data['current']['condition']['text'];

    WeatherModel weather = WeatherModel(
      date: date,
      temp: temp,
      minTemp: minTemp,
      maxTemp: maxTemp,
      weatherStateName: condition,
    );

    return weather;
  }
}
