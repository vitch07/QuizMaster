import 'package:flutter/material.dart';
// import 'package:adv_app/quiz.dart';
// import 'package:adv_app/quiz_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/images/quiz-logo.png', width: 100),
        SizedBox(height: 100),
        ElevatedButton.icon(
          onPressed: startQuiz,
          style: TextButton.styleFrom(
            padding: EdgeInsets.all(20),
            foregroundColor: Color.fromARGB(252, 14, 14, 14),
            textStyle: TextStyle(fontSize: 20.0),
          ),
          icon: Icon(Icons.arrow_right_alt),
          label: Text('Welcome to Quiz competition !!'),
        ),
      ],
    );
  }
}
