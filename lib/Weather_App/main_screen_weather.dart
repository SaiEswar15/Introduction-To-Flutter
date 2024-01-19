import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child:  Column(
        children : [
           SizedBox(
            width : double.infinity,
            child: Card(
              
              elevation: 10,
              child : Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      "300°K",
                      style : TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height : 10,
                    ),
                    Icon(
                      Icons.cloud,
                      size: 50,
                    ),
                    SizedBox(
                      height : 10,
                    ),
                    Text(
                      "Rain",
                      style : TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height : 20,
          ),
          Placeholder(
            fallbackHeight: 150,
          ),
          SizedBox(
            height : 20,
          ),
          Placeholder(
            fallbackHeight: 150,
          ),
        ],
      ),
    );
  }
}