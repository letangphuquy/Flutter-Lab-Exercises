import 'package:flutter/material.dart';
import 'package:lab8_bmi/header.dart';
// import 'header.dart';
import 'input_form.dart';
import 'result_display.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BMICalculator(),
    );
  }
}

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  double _bmi = 0.0;
  String _category = '';

  void _calculateBMI(double height, double weight) {
    setState(() {
      setState(() {
        _bmi = weight / (height * height); // Tính BMI: cân nặng / (chiều cao^2)
        if (_bmi < 18.5) {
          _category = 'Gầy';
        } else if (_bmi < 25) {
          _category = 'Bình thường';
        } else if (_bmi < 30) {
          _category = 'Thừa cân';
        } else {
          _category = 'Béo phì';
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Header(),
      ),
      body: Column(
        children: [
          InputForm(onCalculate: _calculateBMI),
          ResultDisplay(bmi: _bmi, category: _category),
        ],
      ),
    );
  }
}
