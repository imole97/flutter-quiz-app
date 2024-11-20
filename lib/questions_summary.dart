import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summaryData});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      // singleChildScrollView is prevents an overflow and makes contents scrollable
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            final isCorrect = data['is_correct'] as bool;
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: isCorrect
                        ? Colors.green
                        : const Color.fromARGB(255, 237, 120, 112),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: const TextStyle(fontSize: 10),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                /*expanded  prevents allows for its child to maintain the width of it's flex widget,
                in this case, the row widget. column only expands to fill up the space provided by row 
                 **/
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        data['user_answer'] as String,
                        style: const TextStyle(color: Color(0xFFFFE082)),
                      ),
                      Text(
                        data['correct_answer'] as String,
                        style: const TextStyle(
                          color: Color(0xFFD1C4E9),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
