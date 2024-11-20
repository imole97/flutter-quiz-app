import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answerText, this.handleAnswerClick, {super.key});

  final String answerText;
  final void Function() handleAnswerClick;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: handleAnswerClick,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white, // White background for contrast
        foregroundColor: const Color(0xFF6200EA), // Purple text color
        elevation: 6, // Elevation for a subtle shadow effect
        shadowColor: Colors.black26, // Slight shadow for depth
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Rounded corners
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      ),
      child: Text(
        answerText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
