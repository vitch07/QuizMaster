// import 'package:flutter/material.dart';

class QuizQuestion {
  QuizQuestion(this.question, this.answers, this.correctAnswer);
  final String question;
  final List<String> answers;
  final String correctAnswer;

  List<String> getShuffledAnswers() {
    final shuffledAnswers = List.of(answers);
    shuffledAnswers.shuffle();
    return shuffledAnswers;
  }

  bool isCorrectAnswer(String selectedAnswer) {
    return selectedAnswer == correctAnswer;
  }
}
