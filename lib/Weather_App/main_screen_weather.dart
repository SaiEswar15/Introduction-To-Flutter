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
        final temperature = data["list"][0]["main"]["temp"];
        final type = data["list"][0]["weather"][0]["main"];
        final humidity = data["list"][0]["main"]["humidity"] ;
        final windSpeed = data["list"][0]["wind"]["speed"];
        final pressure = data["list"][0]["main"]["pressure"];



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
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     children: [
            //       for(int i = 1;i<=40;i++)
            //         const HourlyForcastWidget(
            //           time: "09 : 00",
            //           icon: Icons.cloud, 
            //           temperature: "301.17"),
            //     ],
            //   ),
            // ),

            SizedBox(
              height : 140,
              child: ListView.builder(
                itemCount: 20,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
              
                  final helper = data["list"][index+1];
                  final typeHelper = helper["weather"][0]["main"];
                  
                  return HourlyForcastWidget(
                        time: helper["dt"].toString(),
                        icon: typeHelper == "Clouds" || typeHelper == "Rain" ? Icons.cloud : Icons.sunny, 
                        temperature: helper["main"]["temp"].toString(),
                      );
                },
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
      
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AdditionalForecast(
                    icon: Icons.water_drop, type: "Humidity", value: humidity.toString()),
                AdditionalForecast(
                    icon: Icons.wind_power, type: "Wind Speed", value: windSpeed.toString()),
                AdditionalForecast(
                    icon: Icons.beach_access, type: "Pressure", value: pressure.toString()),
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
