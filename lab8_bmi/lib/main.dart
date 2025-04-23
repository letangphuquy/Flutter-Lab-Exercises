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
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  double _bmi = 0.0;
  String _category = '';

  void _calculateBMI(double height, double weight) {
    setState(() {
      _bmi = 20;
      _category = 'dummy';
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