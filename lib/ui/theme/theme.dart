import 'package:flutter/material.dart';

MaterialColor _createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

// ignore: non_constant_identifier_names
final ThemeData LightTheme = ThemeData(
  primarySwatch: _createMaterialColor(const Color(0xFF000000)),
  primaryColor: const Color(0xFF000000),
  brightness: Brightness.light,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        fontFamily: 'Inter',
        color: Color(0xFF000000),
        fontSize: 28,
        fontWeight: FontWeight.w800),
    displayMedium: TextStyle(
        fontFamily: 'Inter',
        color: Color(0xFF000000),
        fontSize: 22,
        fontWeight: FontWeight.w800),
    displaySmall: TextStyle(
        fontFamily: 'Inter',
        color: Color(0xFF000000),
        fontSize: 16,
        fontWeight: FontWeight.w500),
    bodyLarge: TextStyle(
        fontFamily: 'Inter',
        color: Color(0xFF000000),
        fontSize: 16,
        fontWeight: FontWeight.w400),
    bodyMedium: TextStyle(
        fontFamily: 'Inter',
        color: Color(0xFF000000),
        fontSize: 12,
        fontWeight: FontWeight.w400),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: MaterialStateProperty.all(0.0),
      foregroundColor: MaterialStateProperty.all(
        const Color(0xFFFFFFFF),
      ),
      backgroundColor: MaterialStateProperty.all(
        const Color(0xFF000000),
      ),
      textStyle: const MaterialStatePropertyAll(TextStyle(fontSize: 16)),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      minimumSize: MaterialStateProperty.all(const Size(double.infinity, 58.0)),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: Colors.white,
    backgroundColor: Color(0xFF000000),
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: Color(0xFFFFFFFF),
    titleTextStyle: TextStyle(
        fontFamily: 'Avenir',
        color: Color(0xFF000000),
        fontSize: 18,
        fontWeight: FontWeight.w700),
    contentTextStyle: TextStyle(
        fontFamily: 'Avenir',
        color: Color(0xFF000000),
        fontSize: 14,
        fontWeight: FontWeight.w500),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      elevation: MaterialStateProperty.all(0.0),
      foregroundColor: MaterialStateProperty.all(
        const Color(0xFF000000),
      ),
      backgroundColor: MaterialStateProperty.all(
        Colors.transparent,
      ),
    ),
  ),
  scaffoldBackgroundColor: const Color(0xFFFFFFFF),
);
