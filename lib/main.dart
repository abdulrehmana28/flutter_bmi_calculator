import 'package:flutter/material.dart';

import 'constants.dart';
import 'input_page.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: kMainColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: kMainColor,
        ),
        scaffoldBackgroundColor: kMainColor,
      ),
      home: InputPage(),
    );
  }
}
/*
        primaryColor: const Color(0xFF0A0E21),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0A0E21),
          // For the title text color
          foregroundColor: Colors.white,
        ),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
        textTheme: const TextTheme(
          // For the body text color in the app
          bodyMedium: TextStyle(color: Colors.white),
        ), */
