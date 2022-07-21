// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:quiz_app/result.dart';
import 'answer.dart';
import 'quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

var _questions = [
  {
    'questionText': 'What\'s your name?',
    'answers': [
      {'text': 'Anel', 'score': 10},
      {'text': 'Kuat', 'score': 5},
      {'text': 'Aigerim', 'score': 7},
      {'text': 'Zere', 'score': 7},
    ],
  },
  {
    'questionText': 'What\'s your favourite food?',
    'answers': [
      {'text': 'Chiken', 'score': 5},
      {'text': 'Pasta', 'score': 10},
      {'text': 'Fruits', 'score': 10},
      {'text': 'Spagetti', 'score': 7},
    ],
  },
  {
    'questionText': 'What\'s your favourite animal?',
    'answers': [
      {'text': 'Rabbit', 'score': 5},
      {'text': 'Snake', 'score': 10},
      {'text': 'Dog', 'score': 5},
      {'text': 'Cat', 'score': 10},
    ],
  },
];

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

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
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My First App'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
