import 'package:bmi/constants/constant.dart';
import 'package:bmi/view/bmi_data_screen.dart';
import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({super.key, required this.bmi});
  final double bmi;

  String determineBmiCategory(double bmiValue) {
    String category = "";
    if (bmiValue < 16.0) {
      category = underweightSevere;
    } else if (bmiValue < 17) {
      category = underweightModerate;
    } else if (bmiValue < 18.5) {
      category = underweightMild;
    } else if (bmiValue < 25) {
      category = normal;
    } else if (bmiValue < 30) {
      category = overweight;
    } else if (bmiValue < 35) {
      category = obeseI;
    } else if (bmiValue < 40) {
      category = obeseII;
    } else if (bmiValue > 40) {
      category = obeseIII;
    }
    return category;
  }

  String getHealRiskDescription(String categoryName) {
    String desc = "";
    switch (categoryName) {
      case underweightSevere:
      case underweightModerate:
      case underweightMild:
        desc = "Possible nutitional deficiency and osteoporosis.";
        break;
      case normal:
        desc = "Low risk (healthy range).";
        break;
      case overweight:
        desc =
            "Moderate risk of deveoping heart disease, high blood pressure, stroke, diabetes mellitus.";
        break;
      case obeseI:
      case obeseII:
      case obeseIII:
        desc =
            "High isk of developing heart disease, high blood pressure, stroke, diabetes mellitus, metabolic syndrome.";
        break;
      default:
    }
    return desc;
  }
/*
   switch (categoryName) {
      case underweightSevere:
        desc = "Possible nutitional deficiency and osteoporosis.";
        break;
      case underweightModerate:
        desc = "Possible nutitional deficiency and osteoporosis.";
        break;
      case underweightMild:
        desc = "Possible nutitional deficiency and osteoporosis.";
        break;
      case normal:
        desc = "Low risk (healthy range).";
        break;
      case overweight:
        desc =
            "Moderate risk of deveoping heart disease, high blood pressure, stroke, diabetes mellitus.";
        break;
      case obeseI:
        desc =
            "High isk of developing heart disease, high blood pressure, stroke, diabetes mellitus, metabolic syndrome.";
        break;
      case obeseII:
        desc =
            "High isk of developing heart disease, high blood pressure, stroke, diabetes mellitus, metabolic syndrome.";
        break;
      case obeseIII:
        desc =
            "High isk of developing heart disease, high blood pressure, stroke, diabetes mellitus, metabolic syndrome.";
        break;
      default:
    }
    return desc;
  }
*/
/*  if (bmiValue < 16.0) {
      category = underweightSevere;
    } else if (bmiValue >= 16 && bmiValue < 17) {
      category = underweightModerate;
    } else if (bmiValue >= 17 && bmiValue < 18.5) {
      category = underweightMild;
    } else if (bmiValue >= 18.5 && bmiValue < 25) {
      category = normal;
    } else if (bmiValue >= 25 && bmiValue < 30) {
      category = overweight;
    } else if (bmiValue >= 30 && bmiValue < 35) {
      category = obeseI;
    } else if (bmiValue >= 35 && bmiValue < 40) {
      category = obeseII;
    } else if (bmiValue > 40) {
      category = obeseIII;
    }
    return category;
  }
*/

  @override
  Widget build(BuildContext context) {
    final bmiCategoy = determineBmiCategory(bmi);
    final bmiDesc = getHealRiskDescription(bmiCategoy);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Hasil BMI"),
        ),
        body: Column(
          children: [
            Expanded(
              // ignore: avoid_unnecessary_containers
              child: Container(
                child: const Text(
                  "Hasil Perhitungan",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: BmiCard(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        bmiCategoy,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        // ignore: unnecessary_string_interpolations
                        "${bmi.toStringAsFixed(1)}",
                        style: const TextStyle(
                          fontSize: 100,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        bmiDesc,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 80,
                color: const Color(0xffEC3C66),
                child: const Center(
                    child: Text(
                  "Hitung Ulang",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )),
              ),
            ),
          ],
        ));
  }
}
