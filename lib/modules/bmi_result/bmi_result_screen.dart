import 'package:bmi_calculator_app/modules/bmi/bmi_home_screen.dart';
import 'package:flutter/material.dart';

class BMIResultScreen extends StatefulWidget {
  String? userGender;
  int? userResult;
  int? userAge;
  String? userStatue;
  String? userAdvice;

  BMIResultScreen({
    required this.userGender,
    required this.userResult,
    required this.userAge,
    required this.userStatue,
    required this.userAdvice,
  });

  @override
  State<BMIResultScreen> createState() => _BMIResultScreenState();
}

class _BMIResultScreenState extends State<BMIResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text(
          "BMI RESULT",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(
              15.0,
            ),
            alignment: Alignment.bottomCenter,
            child: const Text(
              'Your Result',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 500,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(
                    0xFF1D1E33,
                  ),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.black,
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "${widget.userStatue}",
                    style: const TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Result : ${widget.userResult!.round()}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${widget.userAdvice}",
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25.0, color: Colors.white),
                  ),
                  Text(
                    "${widget.userGender}",
                    style: const TextStyle(
                      fontSize: 35.0,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Age : ${widget.userAge}",
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25.0, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.red,
            child: MaterialButton(
              height: 50.0,
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => BMIHomeScreen()));
              },
              child: Text(
                "RE-CALCULATE",
                style: TextStyle(color: Colors.white , fontSize: 25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
