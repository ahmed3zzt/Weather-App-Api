import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';

import '../providers/weather_provider.dart';
import '../services/weather_service.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  String? cityName;
  SearchPage({Key? key}) : super(key: key);
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
            onSubmitted: (data) async {
              cityName = data;

              WeatherService service = WeatherService();

              WeatherModel weather =
                  await service.getWeather(cityName: cityName!);

              Provider.of<WeatherProvider>(context, listen: false).weather =
                  weather;
              Navigator.pop(context);
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
