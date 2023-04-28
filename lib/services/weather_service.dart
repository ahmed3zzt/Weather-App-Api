import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather_model.dart';

class WeatherService {
  Future<WeatherModel> getWeather({required String cityName}) async {
    String baseUrl = 'http://api.weatherapi.com/v1';
    String apiKey = "dd3b016a9dd24c258d4114924232504";

    Uri url =
        Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

    http.Response response = await http.get(url);

    Map<String, dynamic> data = jsonDecode(response.body);

    WeatherModel weather = WeatherModel.fromJson(data);

    return weather;
  }
}
