import "package:flutter/material.dart";

class HourlyForcastWidget extends StatelessWidget {
  final String time;
  final String temperature;
  final IconData icon;

  const HourlyForcastWidget({
    super.key,
    required  this.time,
    required  this.temperature,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 130,
      padding: const EdgeInsets.all(3),
      child: Card(
        elevation: 3,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              time,
              style: const TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Icon(
              icon,
              size: 40,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              temperature,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
