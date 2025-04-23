import 'package:flutter/material.dart';

class ResultDisplay extends StatelessWidget {
  final double bmi;
  final String category;

  const ResultDisplay({super.key, required this.bmi, required this.category});

  @override
  Widget build(BuildContext context) {
    Color color;
    switch (category) {
      case 'Gầy':
        color = Colors.blue;
        break;
      case 'Bình thường':
        color = Colors.green;
        break;
      case 'Thừa cân':
        color = Colors.orange;
        break;
      case 'Béo phì':
        color = Colors.red;
        break;
      default:
        color = Colors.black;
    }

    return Column(
      children: [
        Text(
          'BMI của bạn là ${bmi.toStringAsFixed(2)}',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          category,
          style: TextStyle(fontSize: 24, color: color),
        ),
      ],
    );
  }
}