import "package:flutter/material.dart";
import "package:helloworld/homepage.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Homepage(),
      theme: ThemeData(
        fontFamily: "DancingScript",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
