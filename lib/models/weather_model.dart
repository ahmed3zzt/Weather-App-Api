import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double temp;
  double minTemp;
  double maxTemp;
  String weatherStateName;

  WeatherModel({
    required this.date,
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
    required this.weatherStateName,
  });

  factory WeatherModel.fromJson(dynamic data) {
    WeatherModel? weatherModel;
    try {
      var jsonData;
      jsonData = data['forecast']['forecastday'][0]['day'];

      weatherModel = WeatherModel(
          date: data["location"]['localtime'],
          temp: jsonData['avgtemp_c'],
          minTemp: jsonData['mintemp_c'],
          maxTemp: jsonData['maxtemp_c'],
          weatherStateName: jsonData['condition']['text']);
    } catch (e) {
      print("Value Error");
    }
    return weatherModel ??
        WeatherModel(
            date: "0000",
            temp: 00.00,
            minTemp: 00.00,
            maxTemp: 00.00,
            weatherStateName: "Unknown City");
  }

  String getStateImage() {
    switch (weatherStateName) {
      case "Sunny":
        return "assets/images/clear.png";
      case "Cloudy":
        return "assets/images/cloudy.png";
      case "Party Cloudy":
        return "assets/images/cloudy.png";
      case "Rain":
        return "assets/images/rainy.png";
      case "Snow":
        return "assets/images/snow.png";
      case "Clear":
        return "assets/images/clear.png";
      case "Patchy rain possible":
        return "assets/images/rainy.png";
      default:
        return "assets/images/clear.png";
    }
  }

  Color getStateTheme() {
    switch (weatherStateName) {
      case "Sunny":
        return Colors.yellow;
      case "Cloudy":
        return Colors.grey;
      case "Party Cloudy":
        return Colors.white;
      case "Rain":
        return Colors.blue;
      case "Snow":
        return Colors.cyan;
      case "Clear":
        return Colors.yellow;
      case "Patchy rain possible":
        return Colors.cyan;
      default:
        return Colors.yellow;
    }
  }

  @override
  String toString() {
    return 'tem = $temp , minTemp = $minTemp';
  }
}
