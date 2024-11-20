import 'package:flutter/material.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:flutter_quiz/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.onSwitchScreen, required this.chosenAnswers});

  final List<String> chosenAnswers;

  final void Function() onSwitchScreen;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].text,
        "user_answer": chosenAnswers[i],
        "correct_answer": questions[i].answers[0],
        "is_correct": chosenAnswers[i] == questions[i].answers[0]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalQuestions = questions.length;
    final correctAnswers =
        summaryData.where((data) => data["is_correct"] as bool).length;
    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your answered $correctAnswers out of $totalQuestions questions correctly',
                style: GoogleFonts.lato(fontSize: 16, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              QuestionSummary(summaryData: summaryData),
              const SizedBox(
                height: 30,
              ),
              TextButton.icon(
                icon: const Icon(Icons.refresh, color: Colors.white),
                onPressed: onSwitchScreen,
                label: const Text(
                  "Restart Quiz!",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              )
            ],
          ),
        ));
  }
}
