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
    WeatherProvider weatherProvider =
        Provider.of<WeatherProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search City'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("You Can Search City by Arabic and English Name"),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (data) {
                  cityName = data;
                },
                onSubmitted: (data) async {
                  cityName = data;

                  WeatherService service = WeatherService();

                  WeatherModel weather =
                      await service.getWeather(cityName: cityName!);

                  weatherProvider.cityName = cityName;
                  weatherProvider.weather = weather;
                  Navigator.pop(context);
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 25),
                  label: const Text("Search"),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () async {
                      WeatherService service = WeatherService();

                      WeatherModel weather =
                          await service.getWeather(cityName: cityName!);

                      weatherProvider.cityName = cityName;
                      weatherProvider.weather = weather;
                      Navigator.pop(context);
                    },
                  ),
                  hintText: "Enter City",
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Made With Love ❤️ By {Ahmed Ezzt Sabet}"),
          ],
        ),
      ),
    );
  }
}
