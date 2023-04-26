import 'package:flutter/material.dart';

import '../services/weather_service.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onSubmitted: (data) {
              cityName = data;

              WeatherService service = WeatherService();

              service.getWeather(cityName: cityName!);
            },
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.0, vertical: 25),
              label: Text("Search"),
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.search),
              hintText: "Enter City",
            ),
          ),
        ),
      ),
    );
  }
}
