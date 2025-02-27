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
          appBar: AppBar(
            title: Text("Colorful Musical Notes"),
          ),
          body: Xylophone(),
        )));
  }
}

class Xylophone extends StatelessWidget {
  void playSound(int soundNumber) {
    final player = AudioPlayer();
    player.play(AssetSource('note$soundNumber.wav'), mode: PlayerMode.lowLatency); 
    // don't need to include path explicitly, as we are placing it inside the assets folder
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: [
          Expanded(
              child: TextButton(
            onPressed: () => playSound(1),
            child: Container(),
          ))
        ],
    ));
  }
}
