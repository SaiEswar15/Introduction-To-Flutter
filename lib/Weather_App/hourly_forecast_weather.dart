import "package:flutter/material.dart";

class HourlyForcastWidget extends StatelessWidget {
  // final String time;
  // final  Icon icon;
  // final  String temp;
  const HourlyForcastWidget({
    super.key,
    // required this.icon,
    // required this.time,
    // required this.temp,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 150,
      padding: const EdgeInsets.all(3),
      child: const Card(
        elevation: 3,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "19 : 00",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 3,
            ),
            Icon(
              Icons.cloud,
              size: 50,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "340 ° K",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
