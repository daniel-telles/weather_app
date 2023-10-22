import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String getPeriodOfDay() {
  DateTime now = DateTime.now();
  String format = DateFormat.j().format(now);
  return format;
}

Image imageToShow() {
  if (getPeriodOfDay() == 'AM') {
    return Image.asset('assets/6.png');
  } else {
    return Image.asset('assets/moon.png');
  }
}

Widget getWeatherIcon(int code) {
  switch (code) {
    case > 200 && <= 300:
      return Image.asset('assets/1.png');

    case >= 300 && < 400:
      return Image.asset('assets/2.png');

    case >= 500 && < 600:
      return Image.asset('assets/3.png');

    case >= 600 && < 700:
      return Image.asset('assets/4.png');

    case >= 700 && < 800:
      return Image.asset('assets/5.png');

    case == 800:
      return imageToShow();


    case > 800 && <= 804:
      return Image.asset('assets/8.png');

    default:
      return Image.asset('assets/7.png');
  }
}
