import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHundler;
  final String answerText;

  Answer(this.selectHundler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        onPressed: selectHundler,
        child: Text(answerText),
      ),
    );
  }
}
