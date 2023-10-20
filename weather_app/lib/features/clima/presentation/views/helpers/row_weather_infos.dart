import 'package:flutter/material.dart';

class RowWeatherInfos extends StatelessWidget {
  const RowWeatherInfos(
      {super.key, required this.assetPath, required this.date, required this.description});
  final String assetPath;
  final String date;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              assetPath,
              scale: 8,
            ),
            const SizedBox(width: 5.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: setTextStyleHomeScreenInfos(14, Colors.grey),
                ),
                const SizedBox(height: 3.0),
                Text(
                  date,
                  // '5:34 am',
                  style: setTextStyleHomeScreenInfos(14, Colors.white),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

TextStyle setTextStyleHomeScreenInfos(double fontSize, Color color) =>
    TextStyle(color: color, fontSize: fontSize, fontWeight: FontWeight.normal);
