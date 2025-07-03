import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({required this.ansText, required this.onTap, super.key});
  final void Function() onTap;
  final String ansText;
  @override
  Widget build(context) {
    return Column(
      children: [
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            backgroundColor: const Color.fromARGB(255, 109, 1, 128),
            foregroundColor: Colors.white60,
          ),
          child: Text(
            ansText,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color.fromARGB(255, 249, 248, 248),
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
