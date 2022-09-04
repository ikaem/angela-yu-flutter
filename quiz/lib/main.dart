import 'package:flutter/material.dart';
import 'package:quiz/services/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  return runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // int currentQuestion = 0;
  final List<Widget> scoreKeeper = [];
  final QuizBrain quizBrain = QuizBrain();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("Quiz"),
        backgroundColor: Colors.red,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Center(
                  child: Text(
                    quizBrain.getQuestionText(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextButton(
                  onPressed: () {
                    _handleChooseAnswer(true);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent,
                  ),
                  child: Text(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    "True",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextButton(
                  onPressed: () {
                    _handleChooseAnswer(false);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: Text(
                    "False",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            // TODO: ADD A ROW here as your score keeper
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: _generateScoreIcons(),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showAlert() {
    Alert(context: context, title: "No more questions").show();
  }

  void _handleChooseAnswer(bool answer) {
    quizBrain.score(quizBrain.getQuestionAnswer() == answer);
    quizBrain.goToNextQuestion(_showAlert);
    setState(() {});
    //  TODO this wrks becuase score incorrect or correct sets state and triggers redrwaw
  }

  List<Widget> _generateScoreIcons() {
    return quizBrain.scores.map<Widget>((score) {
      if (score) {
        return const Icon(
          Icons.check,
          color: Colors.green,
        );
      }

      return const Icon(
        Icons.close,
        color: Colors.red,
      );
    }).toList();
  }
}
