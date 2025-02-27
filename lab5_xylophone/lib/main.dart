import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Xylophone',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text("Colorful Musical Notes"),),
          body: MyWidget(),
        )
      )
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyWidgetState();
}
class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Center();
  }

}