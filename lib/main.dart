import "package:flutter/material.dart";
import "./Homepage/homepage.dart";
// import "./Productpage/productpage.dart";
// import "./products.dart";
import "package:provider/provider.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create : (context)=> "hello world!!",
      child: MaterialApp(
        home : Provider(
          create : (context)=> "Heyyy!!",
          child: const Homepage()
          ),
        // home: Productpage(product : products[0]),
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: "DancingScript",
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.amber,
            primary: Colors.amber,
          ),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
          textTheme: const TextTheme(
            titleMedium : TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            bodySmall: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.amber,
            centerTitle: true,
          ),
        ),
        debugShowCheckedModeBanner: false,
        
      ),
    );
  }
}
