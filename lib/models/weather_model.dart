class WeatherModel {
  final String date;
  final double temp;
  final double minTemp;
  final double maxTemp;
  final String weatherStateName;

  WeatherModel({
    required this.date,
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
    required this.weatherStateName,
  });
}
