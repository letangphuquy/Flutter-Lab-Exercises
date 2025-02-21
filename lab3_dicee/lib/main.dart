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
  int number = 0; // Trying to change state in a StatelessWidget

  void rollDice() {
    setState(() {
      number = Random().nextInt(6) % 6 + 1;
    });
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
                  // Expanded(
                  // child:
                  TextButton(
                      onPressed: rollDice,
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10)), // ✅ Makes button fit square image
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(4),
                        child: Image.asset(
                          "images/dice$number.png",
                          width: 100,
                          height: 100,
                        ),
                      )),
                  // ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: rollDice,
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
