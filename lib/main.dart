import 'package:bmi_calculator_app/modules/app_login/login_screen.dart';
import 'package:bmi_calculator_app/modules/app_register/register_screen.dart';
import 'package:bmi_calculator_app/modules/bmi/bmi_home_screen.dart';
import 'package:bmi_calculator_app/modules/bmi_result/bmi_result_screen.dart';
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
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(
          0xFF0A0E21,
        ),
        scaffoldBackgroundColor: const Color(
          0xFF0A0E21,
        ),
      ),
      home: SafeArea(
        child: LoginScreen(),
      ),
    );
  }
}
