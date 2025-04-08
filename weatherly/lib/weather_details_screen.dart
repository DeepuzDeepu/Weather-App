// weather_details_screen.dart
import 'package:flutter/material.dart';

class WeatherDetailsScreen extends StatelessWidget {
  final String cityName;
  final double temperature;
  final String weatherDescription;

  const WeatherDetailsScreen({
    Key? key,
    required this.cityName,
    required this.temperature,
    required this.weatherDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather in $cityName'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Temperature: ${temperature.toStringAsFixed(1)}°C',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Condition: $weatherDescription',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}