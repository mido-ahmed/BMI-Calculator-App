import 'dart:math';

import 'package:bmi_calculator_app/modules/bmi_result/bmi_result_screen.dart';
import 'package:flutter/material.dart';

class BMIHomeScreen extends StatefulWidget {
  const BMIHomeScreen({super.key});

  @override
  State<BMIHomeScreen> createState() => _BMIHomeScreenState();
}

class _BMIHomeScreenState extends State<BMIHomeScreen> {
  bool isMale = true;
  String? gender;
  double height = 120;
  dynamic weight = 90;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: isMale ? Colors.blue : Colors.purple,
        title: Text(
          "BMI CALCULATOR",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = true;
                        gender = 'Male';
                      });
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.male,
                            size: 135.0,
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "MALE",
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: isMale ? Colors.blue : Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = false;
                        gender = 'Female';
                      });
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.female,
                            size: 135.0,
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "FEMALE",
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: !isMale ? Colors.purple : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.grey,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${height.round()}",
                        style: TextStyle(
                            fontSize: 40.0, fontWeight: FontWeight.w900),
                      ),
                      Text(
                        "cm",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Slider(
                    activeColor: isMale ? Colors.blue : Colors.purple,
                    value: height,
                    min: 40.0,
                    max: 220.0,
                    onChanged: (value) {
                      setState(() {
                        height = value;
                        print(value.round());
                      });
                    },
                  )
                ],
              ),
            ),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.grey,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${weight}",
                          style: TextStyle(
                              fontSize: 40.0, fontWeight: FontWeight.w900),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              heroTag: 'weight-',
                              backgroundColor:
                                  isMale ? Colors.blue : Colors.purple,
                              child: Icon(
                                Icons.remove,
                              ),
                              mini: true,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              heroTag: 'weight+',
                              backgroundColor:
                                  isMale ? Colors.blue : Colors.purple,
                              child: Icon(Icons.add),
                              mini: true,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.grey,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${age}",
                          style: TextStyle(
                              fontSize: 40.0, fontWeight: FontWeight.w900),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              backgroundColor:
                                  isMale ? Colors.blue : Colors.purple,
                              child: Icon(
                                Icons.remove,
                              ),
                              heroTag: 'age-',
                              mini: true,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              backgroundColor:
                                  isMale ? Colors.blue : Colors.purple,
                              child: Icon(Icons.add),
                              heroTag: 'age+',
                              mini: true,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
          Container(
            width: double.infinity,
            color: isMale ? Colors.blue : Colors.purple,
            child: MaterialButton(
              height: 50.0,
              onPressed: () {
                double result = weight / pow(height / 100, 2);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BMIResultScreen(
                              userAge: age,
                              userResult: result.round(),
                              userGender: gender,
                            )));
              },
              child: Text(
                "Calculate",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
