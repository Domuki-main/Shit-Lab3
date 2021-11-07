import 'package:flutter/material.dart';
import 'package:flutter_lab3/result.dart';
import './quiz.dart';
import './result.dart';
// import './answer.dart';
// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp()); //only one expression

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  // this state is belongs to MyApp
  var questionIndex = 0;

  final questions = const [
    {
      'questionText': 'what\'s your favourite colour?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'what\'s your favourite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ],
    },
    {
      'questionText': 'who\'s your favourite Doctor?',
      'answers': [
        {'text': 'Dr. Ng', 'score': 15},
        {'text': 'Dr. Ng', 'score': 15},
        {'text': 'Dr. Ng', 'score': 15},
        {'text': 'Dr. Ng', 'score': 15},
      ],
    },
  ];

  var totalScore = 0;

  void answerQuestion(int score) {
    totalScore += score;

    setState(() {
      questionIndex++;
    });
  }

  void clearIndex() {
    questionIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first app'),
        ),
        body: questionIndex < questions.length
            ? Quiz(
                answerQuestion: answerQuestion,
                questionIndex: questionIndex,
                questions: questions,
              )
            : Result(totalScore),
      ),
    );
  }
}
