import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  int leftDice = 0; // Trying to change state in a StatelessWidget
  int rightDice = 0;

  void rollLeftDice() {
    setState(() {
      leftDice = Random().nextInt(6) % 6 + 1;
    });
  }

  void rollRightDice() {
    setState(() {
      rightDice = Random().nextInt(6) % 6 + 1;
    });
  }

  void rollTwoDices() {
    rollLeftDice();
    rollRightDice();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Dicey")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextButton(
                        onPressed: rollLeftDice,
                        child: Padding(
                          padding: EdgeInsets.all(4),
                          child: Image.asset(
                            "images/dice$leftDice.png",
                            width: 100,
                            height: 100,
                          ),
                        )),
                  ),
                  Expanded(
                    child: TextButton(
                        onPressed: rollRightDice,
                        child: Padding(
                          padding: EdgeInsets.all(4),
                          child: Image.asset(
                            "images/dice$rightDice.png",
                            width: 100,
                            height: 100,
                          ),
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: rollTwoDices,
                  child: Text(
                    "Roll dice!",
                    style: TextStyle(fontSize: 24),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
