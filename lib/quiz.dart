import 'package:flutter/material.dart';
import 'package:adv_app/quiz_screen.dart';
import 'package:adv_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // in this techiue two types of state object is used one to use the initState() or otherwise using the ternary expression
  // Widget? activeScreen;
  // @override
  // void initState() {
  var activeScreen = 'start-screen';
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = 'quiz-screen';
    });
  }

  void restartQuiz() {
    setState(() {
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            style: TextStyle(color: Color.fromARGB(206, 20, 41, 54)),
            "Quiz_app",
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 4, 12, 125),
                Color.fromARGB(195, 74, 2, 103),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child:
                activeScreen == 'start-screen'
                    ? StartScreen(switchScreen)
                    : QuizScreen(onRestart: restartQuiz),
          ),
        ),
      ),
    );
  }
}
