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
  int counter = 0; // Trying to change state in a StatelessWidget

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Dicey")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Hello World. Number should go in here"),
              ElevatedButton(
                onPressed: () {},
                child: Text("Roll dice"),
              ),
            ],
          ),
        ),
      ),
    );
  }
  

}