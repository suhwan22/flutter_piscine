import 'package:flutter/material.dart';
import 'custom_widget/bmi_input_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bmi_calculator',
      theme: ThemeData(primaryColor: Colors.green),
      home: BMICalculator(),
    );
  }
}
