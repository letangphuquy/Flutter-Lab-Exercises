import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  Widget build(BuildContext context) {
        return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 123, 134, 130),
        appBar: AppBar(
          title: const Text("I am Rich!",
            style: TextStyle(
              fontFamily: 'Nunito',
                fontSize: 36,
                // fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                wordSpacing: 5.0,
                shadows: [
                Shadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 3.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                ],
            ),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 30, 92, 129),
          foregroundColor: Colors.white,
          toolbarHeight: 100,
        ),
        body: Center(
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.orange,
              )
            ],
          ),
        ),
      ),
    );
    // return SafeArea(
      
    //   child: Column(
    //     children: <Widget>[
    //       Expanded(child: Text("Phu Quy")),
    //       Expanded(child: Text("Student")),

    //     ],
    //   )
    // );
  }
}
