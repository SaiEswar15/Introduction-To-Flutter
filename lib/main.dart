import "package:flutter/material.dart";
import "./Weather_App/main_screen_weather.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  //Instead of writing the whole app inside a single runApp()
  //we can break the code into modules so we create a class [MyApp] which
  //extends the Stateless Widget. We will break the code into components
  //and have them in our [MyApp] like AppBar, Card1 and Card2

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
