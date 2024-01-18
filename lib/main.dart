import "package:flutter/cupertino.dart";
import "./currency_converter_cupertino_page.dart";

void main() {
  runApp(const MyApp()); //const is a compile time mutable
}

class MyApp extends StatelessWidget {
  

  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return const CupertinoApp(
      home : CurrencyConverterCupertinoPage()
    );
  }
}
