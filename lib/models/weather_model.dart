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
    var jsonData = data['forecast']['forecastday'][0]['day'];

    return WeatherModel(
        date: data["location"]['localtime'],
        temp: jsonData['avgtemp_c'],
        minTemp: jsonData['mintemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        weatherStateName: jsonData['condition']['text']);
  }

  String getState() {
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

  @override
  String toString() {
    return 'tem = $temp , minTemp = $minTemp';
  }
}
