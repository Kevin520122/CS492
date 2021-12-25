import 'package:flutter/material.dart';
import '../models/answers.dart';

// ignore: camel_case_types
class predictor_screen extends StatefulWidget {
  @override
  _predictor_screen createState() => _predictor_screen();
}

// ignore: camel_case_types
class _predictor_screen extends State<predictor_screen> {
  final answers = Answer();

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [title(), question(), response()],
    );
  }

  Widget title() {
    return Text("Call Me Maybe?",
        style: TextStyle(fontFamily: 'Poppins-Regular', fontSize: 30));
  }

  Widget question() {
    return GestureDetector(
        //Once tap, it will randomly select an answer
        onTap: () {
          setState(() {
            answers.roll();
          });
        },
        child: Text('Ask a question ... tap for answers',
            style: TextStyle(fontFamily: 'Poppins-Regular', fontSize: 20)));
  }

  Widget response() {
    return Text('${answers.ans}',
        style: TextStyle(fontFamily: 'Poppins-Bold', fontSize: 30));
  }
}
