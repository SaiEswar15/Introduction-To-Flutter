import "dart:convert";
import "package:flutter/material.dart";
import "./Weather_App/main_screen_weather.dart";
import "package:http/http.dart" as http;
// import "Weather_App/secrets.dart";
//api.openweathermap.org/data/2.5/weather?q=$cityName&APPID=$weatherApiKey

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {

  @override
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // final cityName = "London,uk";

  Future<dynamic> getWeatherData() async {

    final response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=8804292f320285f22a0cc2538cfd625a"
      )
    );
    final data = await jsonDecode(response.body);
    
    print(data["coord"]["lon"]);

  }

  @override
  void initState() {
    
    super.initState();
    getWeatherData();

  }

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
