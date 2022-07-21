// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

var questions = [
  {
    'questionText': 'What\'s your name?',
    'answers': ['Anel', 'Kuat', 'Aigerim', 'Zere'],
  },
  {
    'questionText': 'What\'s your favourite food?',
    'answers': ['Chiken', 'Pasta', 'fruits', 'Spagetti'],
  },
  {
    'questionText': 'What\'s your favourite animal?',
    'answers': ['Rabbit', 'Snake', 'Dog', 'Cat'],
  },
];

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < questions.length) {
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
        body: _questionIndex < questions.length
            ? Column(
                children: [
                  Question(
                    questions[_questionIndex]['questionText'] as String,
                  ),
                  ...(questions[_questionIndex]['answers'] as List<String>)
                      .map((answers) {
                    return Answer(_answerQuestion, answers);
                  }).toList()
                ],
              )
            : Center(
                child: Text('You did it!'),
              ),
      ),
    );
  }
}
