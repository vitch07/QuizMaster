import 'package:flutter/material.dart';
import 'package:adv_app/answer_button.dart';
import 'package:adv_app/data/questions.dart';
import 'package:adv_app/results_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.onRestart});

  final VoidCallback onRestart;

  @override
  State<QuizScreen> createState() {
    return _QuizScreenState();
  }
}

class _QuizScreenState extends State<QuizScreen> {
  var currentQuestionIndex = 0;
  List<String> chosenAnswers = [];

  void answerQuestion(String selectedAnswer) {
    chosenAnswers.add(selectedAnswer);

    setState(() {
      currentQuestionIndex += 1;
    });
  }

  void restartQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      chosenAnswers = [];
    });
    widget.onRestart();
  }

  @override
  Widget build(context) {
    // Check if all questions are answered
    if (chosenAnswers.length == questions.length) {
      return ResultsScreen(
        chosenAnswers: chosenAnswers,
        onRestart: restartQuiz,
      );
    }

    final currentQuestion = questions[currentQuestionIndex];

    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        width: double.infinity,
        // height: 400, // You can set a specific height if needed
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                currentQuestion.question,
                style: GoogleFonts.lato(color: Colors.white, fontSize: 24),
                textAlign: TextAlign.center,
                // style: TextStyle(
                //   color: const Color.fromARGB(255, 199, 31, 126),
                //   // backgroundColor: Color.fromARGB(255, 251, 251, 251),
                //   fontSize: 15,
                //   fontFamily: 'georgia',
              ),
              // ),
              const SizedBox(height: 30),
              // for the dynamic button development in order  to develop multiple options
              ...currentQuestion.getShuffledAnswers().map((items) {
                return AnswerButton(
                  ansText: items,
                  onTap: () => answerQuestion(items),
                );
              }),
              // AnswerButton(ansText: currentQuestion.answers[0], onTap: () {}),
              // AnswerButton(ansText: currentQuestion.answers[1], onTap: () {}),
              // AnswerButton(ansText: currentQuestion.answers[2], onTap: () {}),
              // AnswerButton(ansText: currentQuestion.answers[3], onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
