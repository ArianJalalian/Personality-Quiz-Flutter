import 'package:flutter/material.dart';

import './result.dart';
import './quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      'questionText': 'what is your favourite color ?',
      'answers': [
        {'text': 'black', 'score': 10},
        {'text': 'blue', 'score': 5},
        {'text': 'red', 'score': 7},
        {'text': 'yellow', 'score': 6},
      ]
    },
    {
      'questionText': 'what is your favourite animal ?',
      'answers': [
        {'text': 'lion', 'score': 7},
        {'text': 'tiger', 'score': 6},
        {'text': 'fish', 'score': 3},
        {'text': 'cat', 'score': 4},
      ]
    },
    {
      'questionText': 'what is your favourite tv show ?',
      'answers': [
        {'text': 'F.r.i.e.n.d.s', 'score': 3},
        {'text': 'How I met your mother', 'score': 3},
        {'text': 'The Office', 'score': 4},
        {'text': 'Breaking Bad', 'score': 6},
      ]
    },
  ];

  void _reset() {
    print(_totalScore);
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
    return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Personality Quiz'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _reset),
      ),
    );
  }
}
