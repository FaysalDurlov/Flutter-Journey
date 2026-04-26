import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/additional_Info_item.dart';
import 'package:weather_app/hourly_forcast_item.dart';
import 'package:http/http.dart' as http;
import 'api_config.dart';


class WeatherScreen extends StatefulWidget {
  WeatherScreen({super.key});
  
  @override
  State<WeatherScreen> createState(){
    return _WeatherScreenState();
  } 
}

class _WeatherScreenState extends State<WeatherScreen> {

  final apiKey = ApiConfig.weatherApiKey;
  
  Future<Map<String, dynamic>> getCurrentWeather() async {
    try{
      String cityName = "Bangladesh";
      String shortformat = "BD";
      final result = await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/forecast?q=$cityName,$shortformat&APPID=$apiKey"));
      
      final data = jsonDecode(result.body);

      if(data['cod'] != "200") {
        throw "Error Occurred !";
      }

      return data;

    }catch(e){
      print(e);
      throw "Error Occurred !";
    }
  }

  @override
  void initState() {
    super.initState();
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
        body:FutureBuilder(
          future: getCurrentWeather(),
          builder:(context, snapshot) {
            
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator.adaptive(),);
            }
            if(snapshot.hasError){
              return Center(child: Text("Error fetching weather data"),);
            }

            final data = snapshot.data!;
            final currentTemp = data['list'][0]['main']['temp'];
            final currentSky = data['list'][0]['weather'][0]['main'];
            final currentHumidity = data['list'][0]['main']['humidity'];
            final currentWindSpeed = data['list'][0]['wind']['speed'];
            final currentPressure = data['list'][0]['main']['pressure'];

            IconData setLogo() {
              if(currentSky == "Clouds"){
                return Icons.cloud;
              } else if(currentSky == "Clear"){
                return Icons.wb_sunny;
              } else if(currentSky == "Rain"){
                return Icons.beach_access;
              } else {
                return Icons.cloud;
              }
            }
            IconData logo = setLogo();




            return Padding( 
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
                              Text("$currentTemp °K",
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 16),
                              Icon(logo, size: 64),
                              SizedBox(height: 16),
                              Text("$currentSky",
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
                const Text("Hourly Forecast",
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
                      for(int i = 0; i < 5; i++)
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
                    AdditionalInfoItem(icons: Icons.water_drop, label: "Humidity", value: "$currentHumidity"),
                    AdditionalInfoItem(icons: Icons.air, label: "Wind Speed", value: "$currentWindSpeed"),
                    AdditionalInfoItem(icons: Icons.beach_access, label: "Pressure", value: "$currentPressure"),
                  ],
                )
              ],
            ),
          );
          },
        ),

      );
  }
}
