import 'package:flutter/material.dart';
import 'package:bmi_calculator/screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff0a0e21),
        accentColor: Color(0xff4c4f5e),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0xff4c4f5e),
        ),
        scaffoldBackgroundColor: Color(0xff0a0e21),
      ),
      home: InputPage(),
    );
  }
}
