class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;
  

  List<String> getShuffledAnswer() {
    // List.of() is used to make a copy of a list
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
 
}
