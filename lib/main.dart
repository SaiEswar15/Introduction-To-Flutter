import "package:flutter/material.dart";
import "./homepage.dart";
void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{

  @override
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: const Homepage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
    );
  }
}