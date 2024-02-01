import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "OUTFIT GALLERY",
            style : TextStyle(
              fontFamily: "Honk",
              fontSize: 25,
            ),
          ),
        ),
        body: const Center(
          child: Text(
            "Eswar",
            style : TextStyle(
              fontFamily: "DancingScript",
              fontSize: 25,
            ),
          ),
        ),
      );
  }
}