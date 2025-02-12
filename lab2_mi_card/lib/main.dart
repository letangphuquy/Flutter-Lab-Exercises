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
        backgroundColor: Color.fromARGB(255, 21, 111, 78),
        appBar: AppBar(
          title: const Text("My Card - basic portfolio"),
          centerTitle: true,
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("images/pq.jfif"),
              ),
              Text(
                "My Name",
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("JobTitle", style: TextStyle(fontFamily: 'Arial')),
              SizedBox(
                height: 20,
              ),
              Card(
                child: ListTile(title: Text("Card 1")),
              ),
              Card(
                child: ListTile(title: Text("Card 2")),
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
