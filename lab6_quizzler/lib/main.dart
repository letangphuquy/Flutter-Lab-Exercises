import 'package:flutter/material.dart';

void main() {
  runApp(QuizzlerApp());
}

class QuizzlerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Map<String, dynamic>> questionBank = [
    {'question': 'Bananas are berries, but strawberries are not.', 'answer': true},
    {'question': 'A day on Venus is longer than a year on Venus.', 'answer': true},
    {'question': 'Humans share about 50% of their DNA with bananas.', 'answer': true},
    {'question': 'Goldfish only have a 3-second memory.', 'answer': false},
    {'question': 'Octopuses have three hearts.', 'answer': true},
    {'question': 'There’s a town in Norway called "Hell."', 'answer': true},
    {'question': 'Honey never spoils — archaeologists found 3,000-year-old honey that’s still edible.', 'answer': true},
    {'question': 'You can sneeze with your eyes open.', 'answer': true},
    {'question': 'The inventor of the frisbee was turned into a frisbee after he died.', 'answer': true},
    {'question': 'A group of flamingos is called a "flamboyance."', 'answer': true},
  ];


  int questionIndex = 0;
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userAnswer) {
    final correctAnswer = questionBank[questionIndex]['answer'];

    setState(() {
      if (userAnswer == correctAnswer) {
        scoreKeeper.add(Icon(Icons.check, color: Colors.green));
      } else {
        scoreKeeper.add(Icon(Icons.close, color: Colors.red));
      }

      if (questionIndex < questionBank.length - 1) {
        questionIndex++;
      } else {
        // Optional: Show dialog when quiz ends
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Quiz Complete!'),
            content: Text('Restarting...'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  resetQuiz();
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    });
  }

  void resetQuiz() {
    setState(() {
      questionIndex = 0;
      scoreKeeper.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  questionBank[questionIndex]['question'],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () => checkAnswer(true),
                child: Text('True', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () => checkAnswer(false),
                child: Text('False', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
            ),
            Row(children: scoreKeeper), // ✅❌ icons
          ],
        ),
      ),
    );
  }
}
