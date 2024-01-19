import 'dart:ui';
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
                
                HourlyForcastWidget(),
                HourlyForcastWidget(),
                HourlyForcastWidget(),
                HourlyForcastWidget(),
                HourlyForcastWidget(),
                HourlyForcastWidget(),
               
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Placeholder(
            fallbackHeight: 150,
          ),
        ],
      ),
    );
  }
}



