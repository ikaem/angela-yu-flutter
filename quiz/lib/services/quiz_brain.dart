import 'package:quiz/models/question.dart';

typedef ShowAlert = void Function();

class QuizBrain {
  int questionNumber = 0;
  final List<bool> _scoreKeeper = [];
  final List<Question> _questions = [
    Question("You are a person", true),
    Question("2 + 2 = 5", false),
    Question("Moon is a planet", false),
  ];

  String getQuestionText() {
    return _questions[questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questions[questionNumber].questionAnswer;
  }

  int getQuestionsNumber() {
    return _questions.length;
  }

  void goToNextQuestion(ShowAlert showAlert) {
    final nextQuestionNumber = questionNumber + 1;
    if (nextQuestionNumber >= getQuestionsNumber()) {
      showAlert();
      return;
    }

    questionNumber++;
  }

  List<bool> get scores => _scoreKeeper;

  void score(bool isCorrect) {
    if (_scoreKeeper.length == getQuestionsNumber()) return;
    _scoreKeeper.add(isCorrect);
  }
}

// test
class Car {
  int seats = 5;

  void drive() {
    print("driving...");
  }
}

class LevitatingCar extends Car {
  @override
  void drive() {
    print("just flying");

    super.drive();
  }
}

class Human {
  int age;

  Human(this.age);
}
