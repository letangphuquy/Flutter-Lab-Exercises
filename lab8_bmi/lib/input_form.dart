import 'package:flutter/material.dart';

class InputForm extends StatefulWidget {
  final Function(double, double) onCalculate;

  InputForm({required this.onCalculate});

  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  double _age = 30;
  double _weight = 78.0;
  double _height = 175.0;

  final TextEditingController _ageController =
      TextEditingController(text: '30');
  final TextEditingController _weightController =
      TextEditingController(text: '78.0');
  final TextEditingController _heightController =
      TextEditingController(text: '175.0');

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        TextField(
          controller: _ageController,
          decoration: InputDecoration(labelText: 'Age'),
          keyboardType: TextInputType.number,
          onChanged: (value) {
            setState(() {
              _age = double.tryParse(value) ?? _age;
            });
          },
        ),
        TextField(
          controller: _weightController,
          decoration: InputDecoration(labelText: 'Weight (kg)'),
          keyboardType: TextInputType.number,
          onChanged: (value) {
            setState(() {
              _weight = double.tryParse(value) ?? _weight;
            });
          },
        ),
        TextField(
          controller: _heightController,
          decoration: InputDecoration(labelText: 'Height (cm)'),
          keyboardType: TextInputType.number,
          onChanged: (value) {
            setState(() {
              _height = double.tryParse(value) ?? _height;
            });
          },
        ),
        ElevatedButton(
          onPressed: () {
            widget.onCalculate(_height / 100, _weight); // Chuyển cm sang m
          },
          child: Text('Tính toán'),
        ),
      ],
    );
  }
}
