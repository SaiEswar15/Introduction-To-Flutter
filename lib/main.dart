
import "package:flutter/material.dart";
import "./Weather_App/main_screen_weather.dart";

// import "Weather_App/secrets.dart";
//api.openweathermap.org/data/2.5/weather?q=$cityName&APPID=$weatherApiKey

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  @override
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(

          centerTitle: true,
          title: const Text(
            "Weather App",
            style: TextStyle(
              
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),

          actions: [
            IconButton(
              onPressed: (){
                debugPrint("refreshed");
              },
              icon: const Icon(
                Icons.refresh
              ),
            ),
            // GestureDetector(
            //   onTap: (){
            //     debugPrint("refreshed");
            //   },
            //   child: const Icon(
            //     Icons.refresh,
            //   ),
            // ),
            // InkWell(
            //   onTap: (){
            //     debugPrint("refreshed");
            //   },
            //   child: const Icon(
            //     Icons.refresh,
            //   ),
            // ),
          ],
        ),
        body: const WeatherScreen(),
      ),
    );
  }
}
