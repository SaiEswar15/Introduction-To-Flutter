import 'dart:ui';
import 'package:helloworld/Weather_App/additional_forecast_weather.dart';
import "./hourly_forecast_weather.dart";
import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //card1
          SizedBox(
            width: double.infinity,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 5,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        "300 ° K",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Icon(
                        Icons.cloud,
                        size: 50,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Rain",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 20,
          ),

          const Text("Weather Forecast",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

          //card2
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                HourlyForcastWidget(
                    time: "09 : 00", icon: Icons.cloud, temperature: "301.17"),
                HourlyForcastWidget(
                    time: "12 : 00", icon: Icons.cloud, temperature: "301.54"),
                HourlyForcastWidget(
                    time: "15 : 00", icon: Icons.cloud, temperature: "301.11"),
                HourlyForcastWidget(
                    time: "18 : 00", icon: Icons.cloud, temperature: "300.75"),
                HourlyForcastWidget(
                    time: "20 : 00", icon: Icons.cloud, temperature: "301.81"),
                HourlyForcastWidget(
                    time: "23 : 00", icon: Icons.cloud, temperature: "298.67"),
              ],
            ),
          ),

          const SizedBox(
            height: 20,
          ),

          //card3
          const Text(
            "Additional Information",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),

          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AdditionalForecast(icon : Icons.water_drop, type : "Humidity", value : "94"),
              AdditionalForecast(icon : Icons.wind_power, type : "Wind Speed", value : "7.67"),
              AdditionalForecast(icon : Icons.beach_access, type : "Pressure", value : "1006"),
            ],
          ),

          const SizedBox(
            height: 20,
          ),
        ],
      ),
      
    );
  }
}


