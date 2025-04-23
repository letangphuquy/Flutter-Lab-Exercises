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

  final TextEditingController _ageController = TextEditingController(text: '30');
  final TextEditingController _weightController = TextEditingController(text: '78.0');
  final TextEditingController _heightController = TextEditingController(text: '175.0');

  @override
  void initState() {
    super.initState();
    _ageController.addListener(() {
      setState(() {
        _age = double.tryParse(_ageController.text) ?? _age;
      });
    });
    _weightController.addListener(() {
      setState(() {
        _weight = double.tryParse(_weightController.text) ?? _weight;
      });
    });
    _heightController.addListener(() {
      setState(() {
        _height = double.tryParse(_heightController.text) ?? _height;
      });
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Age Input
        Row(
          children: [
            Text('Age: '),
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                setState(() {
                  _age = (_age - 1).clamp(0, 100);
                  _ageController.text = _age.toStringAsFixed(0);
                });
              },
            ),
            Expanded(
              child: TextField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                // decoration: InputDecoration(labelText: 'Age'),
              ),
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  _age = (_age + 1).clamp(0, 100);
                  _ageController.text = _age.toStringAsFixed(0);
                });
              },
            ),
            Expanded(
              child: Slider(
                value: _age,
                min: 0,
                max: 100,
                divisions: 100,
                label: _age.round().toString(),
                onChanged: (value) {
                  setState(() {
                    _age = value;
                    _ageController.text = value.toStringAsFixed(0);
                  });
                },
              ),
            ),
          ],
        ),
        // Weight Input
        Row(
          children: [
            Text('Weight (kg): '),
            Expanded(
              child: TextField(
                controller: _weightController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                // decoration: InputDecoration(labelText: 'Weight'),
              ),
            ),
            Expanded(
              child: Slider(
                value: _weight,
                min: 0,
                max: 200,
                divisions: 2000,
                label: _weight.toStringAsFixed(1),
                onChanged: (value) {
                  setState(() {
                    _weight = value;
                    _weightController.text = value.toStringAsFixed(1);
                  });
                },
              ),
            ),
          ],
        ),
        // Height Input
        Row(
          children: [
            Text('Height (cm): '),
            Expanded(
              child: TextField(
                controller: _heightController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                // decoration: InputDecoration(labelText: 'Height'),
              ),
            ),
            Expanded(
              child: Slider(
                value: _height,
                min: 0,
                max: 250,
                divisions: 2500,
                label: _height.toStringAsFixed(1),
                onChanged: (value) {
                  setState(() {
                    _height = value;
                    _heightController.text = value.toStringAsFixed(1);
                  });
                },
              ),
            ),
          ],
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
