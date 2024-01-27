import "package:flutter/material.dart";
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
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title : const Text(
            "Just practicing"
          ),
        ),
        body: const Center(
          child: Text(
            "hello",
            style : TextStyle(
              color: Colors.amber,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
    );
  }
}