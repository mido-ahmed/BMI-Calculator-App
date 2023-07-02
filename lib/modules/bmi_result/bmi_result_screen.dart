import 'package:flutter/material.dart';

class BMIResultScreen extends StatefulWidget {
  String? userGender;
  int? userResult;
  int? userAge;

  BMIResultScreen(
      {required this.userGender,
      required this.userResult,
      required this.userAge});

  @override
  State<BMIResultScreen> createState() => _BMIResultScreenState();
}

class _BMIResultScreenState extends State<BMIResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // backgroundColor: isMale ? Colors.blue : Colors.purple,
        backgroundColor: Colors.blue,
        title: Text(
          "BMI RESULT",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "GENDER : ${widget.userGender}",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "RESULT :  ${widget.userResult!.round()}",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "AGE :  ${widget.userAge}",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
