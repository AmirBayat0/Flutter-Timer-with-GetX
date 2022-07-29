import 'package:flutter/material.dart';

class MyThemes {
  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme(
        headline1: TextStyle(
          color: Colors.black,
          fontSize: 26,
          fontWeight: FontWeight.w400,
        ),
        headline2: TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.w300,
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.black, size: 35));

  ///
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: const Color.fromARGB(255, 21, 21, 21),
      textTheme: const TextTheme(
        headline1: TextStyle(
          color: Colors.white,
          fontSize: 26,
          fontWeight: FontWeight.w400,
        ),
        headline2: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w300,
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.white, size: 35));
}
