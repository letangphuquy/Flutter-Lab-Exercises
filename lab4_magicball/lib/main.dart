import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MagicBallPage(),
    );
  }
}

class MagicBallPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MagicBallPageState();
}

class _MagicBallPageState extends State<MagicBallPage> {
  int number = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Magic 8 Ball"),),
        backgroundColor: Colors.blue[300],
        body: Center(
          child: Column(
            children: [
              Image(image: AssetImage("images/ball$number.png"))
            ],
          ),
        ),

    );
  }
}
