import 'package:bmi_calculator_app/modules/bmi/bmi_home_screen.dart';
import 'package:bmi_calculator_app/modules/bmi_result/bmi_result_screen.dart';
import 'package:bmi_calculator_app/modules/login/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SafeArea(
        child: LoginScreen(),
      ),
    );
  }
}
