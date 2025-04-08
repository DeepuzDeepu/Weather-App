import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'geolocation.dart'; // Make sure this file exists and has the correct implementation
import 'package:http/http.dart' as http;
import 'dart:convert'; // Import for jsonDecode
import 'weather_details_screen.dart'; // Import the new screen

class loading_screen extends StatefulWidget {
  const loading_screen({super.key});

  @override
  State<loading_screen> createState() => _loading_screenState();
}

class _loading_screenState extends State<loading_screen> {
  void getlocation() async {
    try {
      var Location = await location.getCurrentlocation(); // Call the static method directly on the class

      print(Location.latitude);
      print("HI");
      print(Location.longitude);

      // Call API with the actual coordinates
      getData(Location.latitude!, Location.longitude!); // Use null assertion
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  void getData(double lat, double lon) async {
    try {
      final response = await http.get(
          Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=0ca798f0da7722ae3afc13734df4eb39&units=metric')
      );

      if (response.statusCode == 200) {
        // Parse the JSON response
        var data = jsonDecode(response.body);
        String cityName = data['name'];
        double temperature = data['main']['temp'];
        String weatherDescription = data['weather'][0]['description'];

        // Navigate to the WeatherDetailsScreen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WeatherDetailsScreen(
              cityName: cityName,
              temperature: temperature,
              weatherDescription: weatherDescription,
            ),
          ),
        );
      } else {
        print('Error fetching weather data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching weather data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image(
            image: AssetImage('images/weather_home.png'),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 55),
            child: Text(
              'Discover the Weather in your City',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 68.5),
            child: Text(
              'Get to know your weather maps and radar precipitation forecast',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade400,
              ),
            ),
          ),
          SizedBox(
            height: 53,
          ),
          GestureDetector(
            onTap: () {
              getlocation();
            },
            child: Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              height: 58,
              decoration: BoxDecoration(
                color: Colors.blue.shade600,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                'Get Weather',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}