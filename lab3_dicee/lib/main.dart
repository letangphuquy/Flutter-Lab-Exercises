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
              Text("$number"),
              ElevatedButton(
                onPressed: () { rollDice(); },
                child: Text("Roll"),
              ),
            ],
          ),
        ),
      ),
    );
  }
  

}