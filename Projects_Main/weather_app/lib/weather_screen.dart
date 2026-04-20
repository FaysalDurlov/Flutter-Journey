import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/additional_Info_item.dart';
import 'package:weather_app/hourly_forcast_item.dart';
import 'package:http/http.dart' as http;
import 'api_config.dart';


class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

  final apiKey = ApiConfig.weatherApiKey;
  final cityName = "Bangladesh";
  final shortformat = "BD";
  
  Future getCurrentWeather() async {
    try {
      print(apiKey);
      final result = await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/forecast?q=$cityName,$shortformat&APPID=$apiKey"));
      final data = jsonDecode(result.body);
      if(data['cod'] != "200") {
        throw "Error Occurred !";
      }
      print(data["list"][0]["main"]["temp"]);

    } catch (e) {
      print("Error fetching weather data: $e");
    }
  }
  
  @override
  void initState() {
    super.initState();
    getCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              print('Refresh button pressed');
            },
            icon: const Icon(Icons.refresh),
          )
        ],
        centerTitle: true,
        title: const Text('Weather App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            )
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 10 ,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX:10, sigmaY: 10),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text("300 °F",
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 16),
                            Icon(Icons.cloud, size: 64),
                            SizedBox(height: 16),
                            Text("Rain",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text("Weather Forecast",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    HourlyForecastItem(time: "09:00", icon: Icons.cloud, temperature: "301.17"),
                    HourlyForecastItem(time: "10:00", icon: Icons.cloud, temperature: "302.45"),
                    HourlyForecastItem(time: "11:00", icon: Icons.cloud, temperature: "303.78"),
                    HourlyForecastItem(time: "12:00", icon: Icons.cloud, temperature: "305.22"),
                    HourlyForecastItem(time: "13:00", icon: Icons.cloud, temperature: "306.66"),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text("Additional Information",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AdditionalInfoItem(icons: Icons.water_drop, label: "Humidity", value: "94"),
                  AdditionalInfoItem(icons: Icons.air, label: "Wind Speed", value: "7.87"),
                  AdditionalInfoItem(icons: Icons.beach_access, label: "Pressure", value: "1016"),
                ],
              )
            ],
          ),
        ),

      );
  }
}
