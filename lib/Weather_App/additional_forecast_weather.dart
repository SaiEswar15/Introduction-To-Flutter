import "package:flutter/material.dart";

class AdditionalForecast extends StatelessWidget {

  final IconData icon;
  final String type;
  final String value;

  const AdditionalForecast({
    super.key,
    required this.icon,
    required this.type,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Icon(
          icon,
          size: 40,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          type,
          style : const TextStyle(
            fontSize: 18
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          value,
          style : const TextStyle(
            fontSize: 16
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}