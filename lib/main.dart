import 'package:flutter/material.dart';
import 'package:helloworld/currency_converter.dart';

void main() {
  runApp(const MyApp()); //const is a compile time mutable
}

class MyApp extends StatelessWidget {
  

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CurrencyConverter()
    );
  }
}
