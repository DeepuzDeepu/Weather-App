import 'package:flutter/material.dart';
import 'loading_screen.dart';

void main() {
  runApp(const Weatherly());
}

class Weatherly extends StatefulWidget {
  const Weatherly({super.key});

  @override
  State<Weatherly> createState() => _WeatherlyState();
}

class _WeatherlyState extends State<Weatherly> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: loading_screen(),
    );
  }
}
