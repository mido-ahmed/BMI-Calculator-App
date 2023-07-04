import 'dart:math';

import 'package:bmi_calculator_app/modules/bmi_result/bmi_result_screen.dart';
import 'package:bmi_calculator_app/shared/components/components.dart';
import 'package:flutter/material.dart';

class BMIHomeScreen extends StatefulWidget {
  const BMIHomeScreen({super.key});

  @override
  State<BMIHomeScreen> createState() => _BMIHomeScreenState();
}

class _BMIHomeScreenState extends State<BMIHomeScreen> {
  bool isMale = true;
  String? gender;
  double height = 135;
  dynamic weight = 90;
  int age = 20;
  String? statue;
  String? advice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF3B4B4).withOpacity(0.3),
        title: Text(
          "BMI CALCULATOR",
          style: TextStyle(
              color: Color(0xFFEAEAEA),
              fontSize: 25,
              fontWeight: FontWeight.bold),
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
                      child: HomeGenderCard(
                        isMale: isMale,
                        label: "MALE",
                        icon: Icons.male,
                        background: isMale
                            ? Colors.blue
                            : Color(0xFF3B4B4).withOpacity(0.3),
                      )),
                ),
                SizedBox(width: 20.0),
                Expanded(
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = false;
                          gender = 'Female';
                        });
                      },
                      child: HomeGenderCard(
                          icon: Icons.female,
                          label: "FEMALE",
                          isMale: isMale,
                          background: !isMale
                              ? Colors.blue
                              : Color(0xFF3B4B4).withOpacity(0.3))),
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
                  color: Color(0xFF3B4B4).withOpacity(0.3)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
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
                    activeColor: Color(0xFFEAEAEA),
                    value: height,
                    min: 40.0,
                    max: 220.0,
                    onChanged: (value) {
                      setState(() {
                        height = value;
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
                  child: HomeValuesCard(
                      label: "WEIGHT",
                      functionOne: () {
                        setState(() {
                          weight--;
                        });
                      },
                      functionTwo: () {
                        setState(() {
                          weight++;
                        });
                      },
                      tagOne: "weight--",
                      tagTwo: "weight++",
                      value: weight),
                ),
                SizedBox(width: 20.0),
                Expanded(
                  child: HomeValuesCard(
                    label: "AGE",
                    functionOne: () {
                      setState(() {
                        age--;
                      });
                    },
                    functionTwo: () {
                      setState(() {
                        age++;
                      });
                    },
                    tagOne: "age--",
                    tagTwo: "age++",
                    value: age,
                  ),
                ),
              ],
            ),
          )),
          Container(
            width: double.infinity,
            color: Color(0xFF3B4B4).withOpacity(0.3),
            child: MaterialButton(
              height: 50.0,
              onPressed: () {
                double result = weight / pow(height / 100, 2);
                if (result >= 18.5 && result <= 25) {
                  statue = "NORMAL";
                  advice = "You have a normal body weight.\nGood job!";
                } else if (result >= 25) {
                  statue = "OVERWEIGHT";
                  advice =
                      "You have a more than normal body weight.\n Try to do more Exercise";
                } else {
                  statue = "UNDERWEIGHT";
                  advice =
                      "You have a lower than normal body weight.\n Try to eat more";
                }
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BMIResultScreen(
                              userAge: age,
                              userResult: result.round(),
                              userGender: gender,
                              userAdvice: advice,
                              userStatue: statue,
                            )));
              },
              child: Text(
                "CALCULATE",
                style: TextStyle(color: Color(0xFFEAEAEA), fontSize: 25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
