import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function reset;
  Result(this.totalScore, this.reset);
  String get resultPhrase {
    String resultText;
    if (totalScore < 15)
      resultText = 'you are inocent!';
    else if (totalScore < 19)
      resultText = 'you are Ok !';
    else
      resultText = 'you are weird !!';
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: this.reset,
            child: Text('Let\'s do it again!'),
          ),
        ],
      ),
    );
  }
}
