import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';

import '../providers/weather_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchPage()));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: Provider.of<WeatherProvider>(context).weather == null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'there is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  )
                ],
              ),
            )
          : Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 3,
                  ),
                  Text(
                    "Cairo",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Updated : 11.5",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/images/clear.png'),
                      Text(
                        "30",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "maxTemp : 34",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "minTemp : 12",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Text(
                    "Clear",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(
                    flex: 5,
                  )
                ],
              ),
            ),
    );
  }
}
