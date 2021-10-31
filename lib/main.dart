import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': '1. ABC?',
      'answers': [
        {'text': 'E', 'score': 0},
        {'text': 'F', 'score': 0},
        {'text': 'D', 'score': 1},
        {'text': 'S', 'score': 0},
      ],
    },
    {
      'questionText': '2. ABC?',
      'answers': [
        {'text': 'E', 'score': 0},
        {'text': 'F', 'score': 0},
        {'text': 'D', 'score': 1},
        {'text': 'S', 'score': 0},
      ],
    },
    {
      'questionText': '3. ABC?',
      'answers': [
        {'text': 'E', 'score': 0},
        {'text': 'F', 'score': 0},
        {'text': 'D', 'score': 1},
        {'text': 'S', 'score': 0},
      ],
    },
    {
      'questionText': '4. ABC?',
      'answers': [
        {'text': 'E', 'score': 0},
        {'text': 'F', 'score': 0},
        {'text': 'D', 'score': 1},
        {'text': 'S', 'score': 0},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;
  String msg = "";
  Color color;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    if (score == 1) {
      msg = " Correct!";
      color = Colors.lightGreen;
    } else if (score == 0) {
      msg = " Incorrect! ";
      color = Colors.red;
    } else {
      msg = "Quiz";
      color = Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(msg),
          backgroundColor: color,
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_totalScore, _resetQuiz),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
