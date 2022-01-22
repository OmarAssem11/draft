import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s you favourite color?',
      'answer': [
        {'text': 'Black', 'Score': 10},
        {'text': 'Red', 'Score': 5},
        {'text': 'Green', 'Score': 3},
        {'text': 'White', 'Score': 1},
      ],
    },
    {
      'questionText': 'What\'s you favourite animal?',
      'answer': [
        {'text': 'Rabbit', 'Score': 3},
        {'text': 'Snake', 'Score': 11},
        {'text': 'Elephant', 'Score': 5},
        {'text': 'Lion', 'Score': 9},
      ],
    },
    {
      'questionText': 'Who\'s you favourite instuctor?',
      'answer': [
        {'text': 'Max', 'Score': 1},
        {'text': 'Max', 'Score': 1},
        {'text': 'Max', 'Score': 1},
        {'text': 'Max', 'Score': 1},
      ],
    },
  ];

  int _questionIndex = 0;
  int _totalScore = 0;

  void _resetQuiz() {
    setState(
      () {
        _questionIndex = 0;
        _totalScore = 0;
      },
    );
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(
      () {
        _questionIndex = _questionIndex + 1;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Quiz',
          ),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
