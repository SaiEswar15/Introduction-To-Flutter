import 'dart:ui';
import 'package:helloworld/Weather_App/additional_forecast_weather.dart';
import "./hourly_forecast_weather.dart";
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import "dart:convert";
import "./secrets.dart";

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final cityName = "London,uk";

  
  double temperature = 0;
  late String type;
  late IconData icon ;



  Future<dynamic> getWeatherData() async {

    // print("2");

    try {

      // print("3");
      final response = await http.get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/forecast?q=$cityName,uk&APPID=$weatherApiKey"));
        
        // print("3.1");

        final data = await jsonDecode(response.body);
        if(data["cod"] == 401)
        {
          return throw "failed to fetch data";
        }
        
      return data;
 
    } catch (error) {

      // print("3.2");
      return throw "Invalid user, Failed to fetch data :(";
    }
  }

  @override
  void initState() {
    super.initState();

    // print("1");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future : getWeatherData(),
      builder :(context, snapshot) {

        // print("4");

        if(snapshot.connectionState == ConnectionState.waiting)
        {
          return const Center(child: CircularProgressIndicator.adaptive());
        }

        if(snapshot.hasError)
        {
          return Center(child: Text("${snapshot.error}"));
        }

        final data = snapshot.data!;
        temperature = data["list"][0]["main"]["temp"];
        type = data["list"][0]["weather"][0]["main"];

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
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          "${temperature.toString()} K",
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Icon(
                          type == "Clouds" || type == "Rain" ? Icons.cloud : Icons.sunny,
                          size: 50,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          type,
                          style: const TextStyle(
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
                AdditionalForecast(
                    icon: Icons.water_drop, type: "Humidity", value: "94"),
                AdditionalForecast(
                    icon: Icons.wind_power, type: "Wind Speed", value: "7.67"),
                AdditionalForecast(
                    icon: Icons.beach_access, type: "Pressure", value: "1006"),
              ],
            ),
      
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      );
      }
    );
  }
}
